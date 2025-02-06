crit = {'Качество зерна', 'Цена зерна', 'Транспортные издержки', ...
            'Форма оплаты', 'Минимальная партия', 'Надежность поставки'};
ranks = [1, 2, 5, 4, 3, 6];
n = length(ranks);
pairwise = zeros(n); % инициализация матрицы 0 для дальнейшего заполнения

for i = 1:n
    for j = 1:n
        if i == j
            pairwise(i, j) = 1; % по диагонали всегда 1 (сравнивается число само с собой)
        elseif ranks(i) < ranks(j)
            pairwise(i, j) = 1; % если i-тый элемент меньше j-того ставим 1
        else
            pairwise(i, j) = 0; % иначе -> если i-тый элемент больше j-того ставим 0
        end
    end
end

disp('Матрица парных сравнений:');
disp(pairwise);

weight = ones(n, 1); % итерированная сила P(0) заполненная 1
disp('Итерированая сила P(0):');
disp(weight);

k = 3; % количество итераций

for it = 1:k
    new = pairwise * weight; % умножаем матрицу парных сравнений на итерированную силу
    weight = new;
    disp('Номер итерации:');
    disp(it);
    disp('Итерированная сила:')
    disp(weight);
end

val = weight / sum(weight); % нормированная итерированная сила
disp('Значимость принятых критериев:');
for i = 1:n
    fprintf('%s: %f\n', crit{i}, val(i))
end

figure;
bar(val);
xticks(1:length(crit)); % позиции меток по оси x
xticklabels(crit); % подписи по оси x
title('Значимость принятых критериев:');
xlabel('Критерии:');
ylabel('Значимость:');
grid on;