% Testing for project 1
x = audioread("..\audio\bladerunner.wav");
nx = (1:length(x))'; % Using transposition to make it vertical
[ny, y] = system(nx,x);
%playaudio(y); % I did this to check what exactly the system function does

plot(ny,y);

% This is a test signal with 101 samples, from 0 to 10 seconds
nx = (0:100)';
x = (0:0.1:10)';

[ny, y] = system2(nx, x);
plot(nx,x);
