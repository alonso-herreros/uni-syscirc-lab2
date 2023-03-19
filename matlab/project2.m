% Testing for project 2

nx = (1:3)';
x = [1 1 2];

nh = (0:1)';
h = [2 1];

stem(nx, x);
figure;
stem(nh, h);

[ny, y] = discreteconvolution(nx, x, nh, h);

figure;
stem(ny, y);
