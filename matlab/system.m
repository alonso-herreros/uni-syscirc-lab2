function [ny, y] = system(nx, x)
%
% y[n] = 0.2 x[n]^2 -0.3 x[n-1]^2 + sin(n) x[n] - 0.4 x[n-2]
%
% Inputs:
% nx: range of time instants at which the input signal is non-zero.
% We assume the input signal is zero out of this range.
% x: values of the input signal at the time instants in nx
%
% Outputs:
% ny: range of time instants at which the output signal is non-zero
% y: values of the output signal
%
% Creating the temporal axis
% If x[n] is defined between nx(1) and nx(end), then the last output sample with
% a non-zero value is nx(end)+2, because of the 0.4*x[n-2] term of the equation
% In the same way, the first sample to use from x[n] is nx(1)-2, which is zero
%
% We define the following vectors considering all the above mentioned:
n_init = nx(1) - 2; % First time point at which we need x[n]
n_end = nx(end) + 2; % Las time where y[n] is non-zero
ny = (nx(1):1:n_end)'; % y[n] will be non-zero between nx(1) and n_end
%
% We define the output signal vector (initialized to 0)
y = zeros(1, length(ny))';
%
% The output is obtained by adding 4 signals
% x[n]^2 Term
% First we extend the vector x to have the same length as y
% To this end we simply include zeros for n>nx(end)
%
x1 = [x; zeros(1,n_end - nx(end))'];
y1 = 0.2*x1.^2;
%
% -.3x[n-1]^2 term
x2 = [0; x; 0]; % The first 0 comes from x[n-1]=0 for n=nx(1) -1
y2 = -.3*x2.^2;
%
% sin(n) x[n]
y3 = sin(ny).*x1;
%
% - 0.4 x[n-2] term
x4 = [zeros(1, nx(1) - n_init)'; x];
y4 = -0.4*x4;
%
% We add the form components
y = y + y1 + y2 + y3 + y4;
