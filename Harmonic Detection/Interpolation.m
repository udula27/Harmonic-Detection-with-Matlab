
% Load the signal and store it in variable "y"
load handel;

% Get first 20,000 sample values
N = 2000;                      % Number of samples needed
signal_subset = y(1:N);

% Define various signals based on the obtained samples
x = y(1:N);
x2 = x(1:2:N);
x3 = x(1:3:N);
x4 = x(1:4:N);

% 3.1 X2 Signal interpolation by adding zeros between each two samples
K2 = 1;

interpolated_signal = [];

for i = 1:length(x2)
    interpolated_signal = [interpolated_signal, x2(i)];
    for j = 1:K2
        interpolated_signal = [interpolated_signal, 0];
    end
end

% Ensure both signals have the same lengths (zero-pad if needed)
x2(end+1: length(interpolated_signal)) = 0;

% Calculate the difference between signals
difference_signal_2 = interpolated_signal - x2;

% Plot the first 50 samples of both signals using stem
figure;
subplot(2, 1, 1)
stem(x2(1:50), 'b', 'Marker', 'o');
title('X2 Original Signal')
hold on;
subplot(2, 1, 2)
stem(interpolated_signal(1:50), 'r', 'Marker', 'x', 'DisplayName', 'Interpolated Version of X2');
title('Interpolated Version of X2');

% Add labels and a legend
xlabel('Time (samples)');
ylabel('Amplitude');

% Hold off to stop overlaying plots
hold off;

% clear interpolated_signal x2
% 
% % Compute the 2-norm of the difference
% norm_difference = norm(difference_signal, 2);

norm_difference_2 = norm(difference_signal_2, 2);
disp(['2-norm of the difference for X2: ', num2str(norm_difference_2)]);

% 3.2 X3 Signal interpolation by adding zeros between each two samples
K3 = 2;

interpolated_signal = [];

for i = 1:length(x3)
    interpolated_signal = [interpolated_signal, x3(i)];
    for j = 1:K3
        interpolated_signal = [interpolated_signal, 0];
    end
end

% Ensure both signals have the same lengths (zero-pad if needed)
x3(end+1: length(interpolated_signal)) = 0;

% Calculate the difference between signals
difference_signal_3 = interpolated_signal - x3;

% Plot the first 50 samples of both signals using stem
figure;
subplot(2, 1, 1)
stem(x3(1:50), 'b', 'Marker', 'o');
title('X3 Original Signal')
hold on;
subplot(2, 1, 2)
stem(interpolated_signal(1:50), 'r', 'Marker', 'x', 'DisplayName', 'Interpolated Version of X2');
title('Interpolated Version of X3');

% Add labels and a legend
xlabel('Time (samples)');
ylabel('Amplitude');

% Hold off to stop overlaying plots
hold off;

norm_difference_3 = norm(difference_signal_3, 2);
disp(['2-norm of the difference for X3: ', num2str(norm_difference_3)]);


% 3.3 X4 Signal interpolation by adding zeros between each two samples
K4 = 3;

interpolated_signal = [];

for i = 1:length(x4)
    interpolated_signal = [interpolated_signal, x4(i)];
    for j = 1:K4
        interpolated_signal = [interpolated_signal, 0];
    end
end

% Ensure both signals have the same lengths (zero-pad if needed)
x4(end+1: length(interpolated_signal)) = 0;

% Calculate the difference between signals
difference_signal_4 = interpolated_signal - x4;

% Plot the first 50 samples of both signals using stem
figure;
subplot(2, 1, 1)
stem(x4(1:50), 'b', 'Marker', 'o');
title('X4 Original Signal')
hold on;
subplot(2, 1, 2)
stem(interpolated_signal(1:50), 'r', 'Marker', 'x', 'DisplayName', 'Interpolated Version of X2');
title('Interpolated Version of X4');

% Add labels and a legend
xlabel('Time (samples)');
ylabel('Amplitude');

% Hold off to stop overlaying plots
hold off;

norm_difference_4 = norm(difference_signal_4, 2);
disp(['2-norm of the difference for X4: ', num2str(norm_difference_4)]);