% Выбор бытовой техники: цифровой фотоаппарат.
%1 Цена
%2 Качество изображения
%3 Простота использования
%4 Автофокус
%5 Размер и вес
%6 Срок службы батареи
alt = 6;
k = 6;

%1 Цена
Pr = [1, 2, 3, 4, 5, 1/2; 
         1/2, 1, 2, 3, 4, 1/3; 
         1/3, 1/2, 1, 2, 3, 1/4; 
         1/4, 1/3, 1/2, 1, 2, 1/5; 
         1/5, 1/4, 1/3, 1/2, 1, 1/6; 
         2, 3, 4, 5, 6, 1];

%2 Качество изображения
Img = [1, 3, 4, 2, 5, 1/3; 
         1/3, 1, 2, 1/2, 4, 1/4; 
         1/4, 1/2, 1, 1/3, 3, 1/5; 
         1/2, 2, 3, 1, 5, 1/3; 
         1/5, 1/4, 1/3, 1/5, 1, 1/6; 
         3, 4, 5, 2, 6, 1];

%3 Простота использования
Use = [1, 4, 5, 2, 3, 1/2; 
         1/4, 1, 2, 1/3, 4, 1/3; 
         1/5, 1/2, 1, 1/4, 2, 1/4; 
         1/2, 3, 4, 1, 5, 1/3; 
         1/3, 1/4, 1/2, 1/5, 1, 1/5; 
         2, 3, 4, 5, 6, 1];

%4 Автофокус
Af = [1, 2, 3, 5, 4, 1/2; 
         1/2, 1, 2, 3, 5, 1/3; 
         1/3, 1/2, 1, 2, 4, 1/4; 
         1/5, 1/3, 1/2, 1, 3, 1/5; 
         1/4, 1/5, 1/4, 1/3, 1, 1/6; 
         2, 3, 4, 5, 6, 1];

%5 Размер и вес
SnW = [1, 3, 4, 2, 5, 1/3; 
         1/3, 1, 2, 1/2, 3, 1/4; 
         1/4, 1/2, 1, 1/3, 2, 1/5; 
         1/2, 2, 3, 1, 4, 1/3; 
         1/5, 1/3, 1/2, 1/4, 1, 1/6; 
         3, 4, 5, 2, 6, 1];

%6 Срок службы батареи
Bat = [1, 2, 3, 4, 5, 1/2; 
         1/2, 1, 2, 3, 4, 1/3; 
         1/3, 1/2, 1, 2, 3, 1/4; 
         1/4, 1/3, 1/2, 1, 2, 1/5; 
         1/5, 1/4, 1/3, 1/2, 1, 1/6; 
         2, 3, 4, 5, 6, 1];

disp('Initial matrix:')
disp(Pr); disp(Img); disp(Use);
disp(Af); disp(SnW); disp(Bat);

% матрица сравнения критериев
S = [1,   2,   3,   4,   5,  2; 
     1/2, 1,   2,   3,   4,  1; 
     1/3, 1/2, 1,   2,   3,  1/2; 
     1/4, 1/3, 1/2, 1,   2,  1/3; 
     1/5, 1/4, 1/3, 1/2, 1,  1/4; 
     1/2, 1,   2,   3,   4,  1];

vecS = zeros(1, k);
nS = zeros(k);
meanS = zeros(1, k);

% Нормализация и расчет весов для критериев
for i = 1:k
    vecS(i) = sum(S(:, i));
    nS(:, i) = S(:, i) / vecS(i);
end

for j = 1:k
    meanS(j) = sum(nS(j, :)) / k;
end

% Нормализация и расчет средних значений для каждой матрицы
nPr = zeros(alt);
nImg = zeros(alt);
nUse = zeros(alt);
nAf = zeros(alt);
nSnW = zeros(alt);
nBat = zeros(alt);

meanPr = zeros(alt, 1);
meanImg = zeros(alt, 1);
meanUse = zeros(alt, 1);
meanAf = zeros(alt, 1);
meanSnW = zeros(alt, 1);
meanBat = zeros(alt, 1);

for i = 1:alt
    vec_sum1 = sum(Pr(:, i));
    nPr(:, i) = Pr(:, i) / vec_sum1;
    vec_sum2 = sum(Img(:, i));
    nImg(:, i) = Img(:, i) / vec_sum2;
    vec_sum3 = sum(Use(:, i));
    nUse(:, i) = Use(:, i) / vec_sum3;
    vec_sum4 = sum(Af(:, i));
    nAf(:, i) = Af(:, i) / vec_sum4;
    vec_sum5 = sum(SnW(:, i));
    nSnW(:, i) = SnW(:, i) / vec_sum5;
    vec_sum6 = sum(Bat(:, i));
    nBat(:, i) = Bat(:, i) / vec_sum6;
end

disp('Normed matrix:')
disp(nPr); disp(nImg); disp(nUse);
disp(nAf); disp(nSnW); disp(nBat);

% средние значения по строкам
for j = 1:alt
    meanPr(j) = sum(nPr(j, :)) / alt;
    meanImg(j) = sum(nImg(j, :)) / alt;
    meanUse(j) = sum(nUse(j, :)) / alt;
    meanAf(j) = sum(nAf(j, :)) / alt;
    meanSnW(j) = sum(nSnW(j, :)) / alt;
    meanBat(j) = sum(nBat(j, :)) / alt;
end

disp('Mean values:')
disp(meanPr); disp(meanImg); disp(meanUse);
disp(meanAf); disp(meanSnW); disp(meanBat);

nMax1 = sum(Pr*meanPr);
nMax2 = sum(Img*meanImg);
nMax3 = sum(Use*meanUse);
nMax4 = sum(Af*meanAf);
nMax5 = sum(SnW*meanSnW);
nMax6 = sum(Bat*meanBat);

disp('Index of consistency:');
disp(nMax1); disp(nMax2); disp(nMax3);
disp(nMax4); disp(nMax5); disp(nMax6);

CI1 = (nMax1 - alt) / (alt - 1);
CI2 = (nMax2 - alt) / (alt - 1);
CI3 = (nMax3 - alt) / (alt - 1);
CI4 = (nMax4 - alt) / (alt - 1);
CI5 = (nMax5 - alt) / (alt - 1);
CI6 = (nMax6 - alt) / (alt - 1);
RI = (1.98 * (alt - 2)) / alt;
CR1 = CI1 / RI;
CR2 = CI2 / RI;
CR3 = CI3 / RI;
CR4 = CI4 / RI;
CR5 = CI5 / RI;
CR6 = CI6 / RI;

disp('Coefficient of consistency:');
disp(CR1); disp(CR2); disp(CR3);
disp(CR4); disp(CR5); disp(CR6);

F = [meanPr, meanImg, meanUse, meanAf, meanSnW, meanBat] * meanS';
disp('Оценки альтернатив:');
disp(F);

[best, ind] = max(F);
disp('Максимальная оценка:');
disp(best);
disp('Оптимальный вариант двигателя:');
disp(ind);