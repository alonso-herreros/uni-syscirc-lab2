% Tests for project 3
x = audioread("..\audio\discursofinal.wav");
nx = (1:length(x))'; % Using transposition to make it vertical

% The first branch is just the original signal
ny1 = nx;
y1 = x;

% First, add a delay. I will do this by simply changing the values in nx
% Distance = 100 m; Speed of sound = 340 m/s; Sampling rate = 11025 Hz
ny2 = nx + floor(100*11025/340);
[ny2, y2] = discreteconvolution(ny2, x, 1:length(h), h); % Use the mountain impulse response
y2 = y2*0.15; % Add attenuation, with A = 0.15

% Add both intermediate signals to a single output signal
ny = (nx(1):ny2(end))'; % y[n] may be non-zero between these values
y = zeros(1, length(ny))';

y(find(ny==ny1(1)):find(ny==ny1(end))) = y(find(ny==ny1(1)):find(ny==ny1(end))) + y1;
y(find(ny==ny2(1)):find(ny==ny2(end))) = y(find(ny==ny2(1)):find(ny==ny2(end))) + y2;

playaudio(y);
