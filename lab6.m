alt = 6;
k = 3;

% матрица мощности 180 176 176 181 177 180
Mn = [
    1, 5, 5, 1/2, 3, 1;
    1/5, 1, 1, 1/7, 1/2, 1/5;
    1/5, 1, 1, 1/7, 1/2, 1/5;
    2, 7, 7, 1, 5, 2;
    1/3, 2, 2, 1/5, 1, 1/3;
    1, 5, 5, 1/2, 3, 1
];

% матрица момента 67 70 68 67 68 66
Km = [
    1, 1/6, 1/3, 1, 1/3, 2;
    6, 1, 5, 6, 5, 7;
    3, 1/5, 1, 3, 1, 5;
    1, 1/6, 1/3, 1, 1/3, 2;
    3, 1/5, 1, 3, 1, 5;
    1/2, 1/7, 1/5, 1/2, 1/5, 1
];


% матрица массы 850 1000 860 820 860 800
M = [
    1, 7, 2, 1/3, 2, 1/5;
    1/7, 1, 1/5, 1/7, 1/5, 1/9;
    1/2, 5, 1, 1/5, 5, 1/7;
    3, 7, 5, 1, 5, 1/3;
    1/2, 5, 1, 1/5, 1, 1/7;
    5, 9, 7, 3, 7, 1
];

% матрица сравнения критериев
S = [
    1,5,9;
    1/5,1,5;
    1/9,1/5,1
];

disp("Матрицы попарных сравнений альтернатив:")
disp(Mn); disp(Km); disp(M);

vecS = zeros(1,k);
nS = zeros(k);
meanS = zeros(1,k);

w1 = zeros(1,alt);
w2 = zeros(1,alt);
w3 = zeros(1,alt);
nMn = zeros(alt);
nKm = zeros(alt);
nM = zeros(alt);
meanMn = zeros(alt,1);
meanKm = zeros(alt,1);
meanM = zeros(alt,1);

% вычисления для матрицы сравнения критериев
for i = 1:k
    vecS(i) = round(sum(S(:,i)),1);
    nS(:,i) = S(:,i)/vecS(i);
end

for j = 1:k
    meanS(j) = sum(nS(j,:))/k;
end

for i = 1:alt
    %веса альтернатив (по столбцам)
    w1(i) = round(sum(Mn(:,i)),1);
    w2(i) = round(sum(Km(:,i)),1);
    w3(i) = round(sum(M(:,i)),1);

    %нормализованные матрицы
    nMn(:,i) = Mn(:,i)/w1(i);
    nKm(:,i) = Km(:,i)/w2(i);
    nM(:,i) = M(:,i)/w3(i);
end

disp('Нормализованные матрицы:');
disp(nMn);
disp(nKm);
disp(nM);

for j = 1:alt
    %Средние значения элементов строк
    meanMn(j) = sum(nMn(j,:))/alt;
    meanKm(j) = sum(nKm(j,:))/alt;
    meanM(j) = sum(nM(j,:))/alt;
end

disp('Средние значения элементов строк:');
disp(meanMn);
disp(meanKm);
disp(meanM);

nMax1 = sum(Mn*meanMn);
nMax2 = sum(Km*meanKm);
nMax3 = sum(M*meanM);

disp('Индекс согласованности:');
disp(nMax1); disp(nMax2); disp(nMax3);

CI1 = (nMax1 - alt) / (alt - 1);
CI2 = (nMax2 - alt) / (alt - 1);
CI3 = (nMax3 - alt) / (alt - 1);
RI = (1.98 * (alt - 2)) / alt;
CR1 = CI1 / RI;
CR2 = CI2 / RI;
CR3 = CI3 / RI;

disp('Коэффициент согласованности матриц:');
disp(CR1);
disp(CR2);
disp(CR3);

F = meanMn * meanS(1) + meanKm * meanS(2) + meanM * meanS(3);

disp('Оценка альтернатив:');
disp(F);

[best, ind] = max(F);
disp('Максимальная оценка:');
disp(best);
disp('Оптимальный вариант двигателя:');
disp(ind);