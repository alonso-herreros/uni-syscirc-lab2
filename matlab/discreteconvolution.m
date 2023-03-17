function [ny, y] = discreteconvolution(nx, x, nh, h)
    %
    % Inputs:
    % nx: range of time instants at which the input signal is non-zero.
    % x: values of the input signal at the time instants in nx
    % nh: range of time instants at which the impulse response is non-zero.
    % h: values of the impulse response
    %
    % Outputs
    % ny: range of time instants at which the output signal is non-zero
    % y: values of the output signal

    % 1.Transform both sequences into their equivalents, starting at n = 1
    % This is already done: x and h already start at n = 1

    % 2. Compute the convolution of the equivalent signals

    y = conv(x, h);

    % 3. Shift the output signal to get the desired signal
    ny = (nx(1)+nh(1):nx(1)+nh(1)+length(y)-1)';

