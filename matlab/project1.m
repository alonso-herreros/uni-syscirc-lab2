% Testing for project 1
x = audioread("..\audio\bladerunner.wav");
nx = (1:length(x))'; % Using transposition to make it vertical
[ny, y] = system(nx,x);
%playaudio(x);

plot(ny,y);


nx = (0:100)';
x = (0:0.1:10)';

% Creating the temporal axis
% x[n] is defined between nx(1) and nx(end) <=> nx(1) <= x <= nx(end)
% x[4-n] defined <=> nx(1) <= 4-n <= nx(end) <=> 4-nx(end) <= n <= 4-nx(1)
nyi = [4-nx(end) 4-nx(1)];
% x[n-5] defined <=> nx(1) <= n-5 <= nx(end) <=> nx(1)+5 <= n <= nx(end)+5
nyi = [nyi; nx(1)+5 nx(end)+5];
% x[2-n] defined <=> nx(1) <= 4-n <= nx(end) <=> 2-nx(end) <= n <= 2-nx(1)
nyi = [nyi; 2-nx(end) 2-nx(1)];

% I don't really care about all the values in between the upper and lower bounds of our support


% Creating an empty signal
ny = (min(nyi(:,1)):max(nyi(:,2)))'; % y[n] may be non-zero between the min lower bound and the max upper bound
y = zeros(1, length(ny))';


% 0.5*x[4 − n] term
y1 = 0.5*x(end:-1:1); % x1 is the vector of values of x[4-n] at the time instants in ny1
y(find(ny==nyi(1,1)):find(ny==nyi(1,2))) = y(find(ny==nyi(1,1)):find(ny==nyi(1,2))) + y1;
figure;
plot(ny,y);

% 0.7*x[n − 5] term
y2 = 0.7*x;
y(find(ny==nyi(2,1)):find(ny==nyi(2,2))) = y(find(ny==nyi(2,1)):find(ny==nyi(2,2))) + y2;
figure;
plot(ny,y);

% -0.4*cos(2*pi*x[2 − n]) term
y3 = -0.4*cos(2*pi*x(end:-1:1));
y(find(ny==nyi(3,1)):find(ny==nyi(3,2))) = y(find(ny==nyi(3,1)):find(ny==nyi(3,2))) + y3;
figure;
plot(ny,y);