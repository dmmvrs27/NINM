x = 2:0.1:10;
y = gaussmf(x,[1.2 6]);
plot(x, y);

x1 = 0:0.1:20;
x2 = 0:0.1:20;
[X, Y] = meshgrid(x1, x2);
Z = min(trimf(X, [7 10 13]), trimf(Y, [7 10 13]));
plot3(X, Y, Z);

x3 = defuzz(X,Z,'centroid');
disp('Результат дефаzzификации:');
disp(x3);
