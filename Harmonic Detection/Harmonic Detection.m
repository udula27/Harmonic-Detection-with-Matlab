load('signal11.mat','xn_test');



%dviding xn_test into subsamples
S1 = xn_test(1:129);
S2 = xn_test(1:257);
S3 = xn_test(1:513);
S4 = xn_test(1:1025);
S5 = xn_test(1:1793);

x = xn_test;

% Apply DFT to each subsample
dft_S1 = fftshift(fft(S1));
dft_S2 = fftshift(fft(S2));
dft_S3 = fftshift(fft(S3));
dft_S4 = fftshift(fft(S4));
dft_S5 = fftshift(fft(S5));

fs = 128;

% Length of each subset
N1 = length(S1);
N2 = length(S2);
N3 = length(S3);
N4 = length(S4);
N5 = length(S5);
% Compute the DFT for each subset

% Compute the frequency axes for plotting
freq1 = linspace(-fs/2, fs/2, N1);
freq2 = linspace(-fs/2, fs/2, N2);
freq3 = linspace(-fs/2, fs/2, N3);
freq4 = linspace(-fs/2, fs/2, N4);
freq5 = linspace(-fs/2, fs/2, N5);

figure('Position', [100, 100, 1000, 300]);
%S1

stem(freq1,abs(dft_S1));
title('DFT of S1');
xlabel('frequency');
ylabel('Amplitude');


%S2
figure('Position', [100, 100, 1000, 300]);

stem(freq2,abs(dft_S2));
title('DFT of S2');
xlabel('frequency');
ylabel('Amplitude');


%S3
figure('Position', [100, 100, 1000, 300]);

stem(freq3,abs(dft_S3));
title('DFT of S3');
xlabel('frequency');
ylabel('Amplitude');

%S4

figure('Position', [100, 100, 1000, 300]);
stem(freq4,abs(dft_S4));
title('DFT of S4');
xlabel('frequency');
ylabel('Amplitude');

%S5
figure('Position', [100, 100, 1000, 300]);

stem(freq5,abs(dft_S5));
title('DFT of S5');
xlabel('frequency');
ylabel('Amplitude');



k = 128;
L = 14;
N = length(x);

%L=14
sum_dft = zeros(1, k);
    for i = 1:L
        sub_x = x((i-1)*k+1:i*k);
        dft_sub_x = fft(sub_x);
        sum_dft = sum_dft + dft_sub_x;
    end
    
 avg_dft = sum_dft / L;  % Use the correct index variable for averaging
    
% Plot in a 2x7 grid
figure('Position', [100, 100, 1000, 300]);
stem(abs(avg_dft)); 
title('Average DFT');
xlim([0,64]);
xlabel('Frequency');
ylabel('Amplitude');


for L = 1:14
    sum_dft = zeros(1, k);
    
    for i = 1:L
        sub_x = x((i-1)*k+1:i*k);
        dft_sub_x = fft(sub_x);
        sum_dft = sum_dft + dft_sub_x;
    end
    
    avg_dft = sum_dft / L;  % Average the DFT

    % Plot the graph in a 2x7 grid
    subplot(2, 7, L); % Create a 2x7 grid and place the L-th plot
    stem(abs(avg_dft));
    title(['L = ' num2str(L)]);
    xlim([0, 64]);
    xlabel('Frequency');
    ylabel('Amplitude');
end

k = 100;
L = 14;
N = length(x);

%L=14
avg_dft = zeros(1, k);
    for i = 1:L
        sub_x = x((i-1)*k+1:i*k);
        dft_sub_x = fft(sub_x);
        avg_dft = avg_dft + dft_sub_x;
    end
    
 avg_dft = avg_dft / L;  % Use the correct index variable for averaging
    
% Plot in a 2x7 grid
figure('Position', [100, 100, 1000, 300]);
stem(abs(avg_dft)); 
title('Average DFT - k = 100');
xlabel('Frequency');
ylabel('Amplitude');
xlim([0,50]);
k = 135;
N = length(x);
L = floor(N/k);


%Iterating through different L values
avg_dft = zeros(1, k);
    for i = 1:L
        sub_x = x((i-1)*k+1:i*k);
        dft_sub_x = fft(sub_x);
        avg_dft = avg_dft + dft_sub_x;
    end
    
 avg_dft = avg_dft / L;  % Use the correct index variable for averaging
    
% Plot in a 2x7 grid
figure('Position', [100, 100, 1000, 300]);
stem(abs(avg_dft)); 
title('Average DFT - k = 135');
xlim([0,floor(k/2)]);
xlabel('Frequency');
ylabel('Amplitude');












