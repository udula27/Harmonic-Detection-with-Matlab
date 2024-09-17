clc;
clear;
close all;

load('handel')

N = 20000;
x = y(1:N);
x2 = x(1:2:N);
x3 = x(1:3:N);
x4 = x(1:4:N);

dft_x2 = fft(x2);
dft_x3 = fft(x3);
dft_x4 = fft(x4);


% Interpolating the Signals in Frequency Domain
interpolated_x2 = interpolation(dft_x2, 1);
interpolated_x3 = interpolation(dft_x3, 2);
interpolated_x4 = interpolation(dft_x4, 3);

% Apply inverse DFT
ifft_x2 = ifft(interpolated_x2);
ifft_x3 = ifft(interpolated_x3);
ifft_x4 = ifft(interpolated_x4);

new_x2 = ifft_x2 * 2;
new_x3 = ifft_x3 * 3;
new_x4 = ifft_x4 * 4;

new_x2 = new_x2(1:((2)*(length(x2)-1))+2);
new_x3 = new_x3(1:((3)*(length(x3)-1))+2);
new_x4 = new_x4(1:((4)*(length(x4)-1))+4);

% Visualizing the Signals
figure('Position', [100, 100, 1200, 400]);
stem(new_x2(1:50));
hold on;
stem(y(1:50), 'red');
hold off;

figure('Position', [100, 100, 1200, 400]);
stem(new_x3(1:50));
hold on;
stem(y(1:50), 'red');
hold off;

figure('Position', [100, 100, 1200, 400]);
stem(new_x4(1:50));
hold on;
stem(y(1:50), 'red');
hold off;

% Calculate the 2-norm between x and redefined_x2
two_norm_x2 = norm(new_x2- x);
fprintf('x2: %f\n', two_norm_x2);
two_norm_x3 = norm(new_x3-x);
fprintf('x3: %f\n', two_norm_x3);
two_norm_x4 = norm( new_x4- x);
fprintf('x4: %f\n', two_norm_x4);