%% Signal Filtering Using MATLAB
% This script demonstrates digital signal filtering by
% removing high-frequency noise from a signal using a

clear;clc;close all

% Signal generation
fs=8000;     % sampling frequency
t=0:1/fs:1;  % time vector is 1 second

% Clean signal
x=sin(2*pi*300*t)+sin(2*pi*900*t);  
%add noise
xn=x+0.05*rand(size(x)); 

% Design filter
fc=500; %cut off frequency
order=4;
[b,a]=butter(order,fc/(fs/2));
 
% Use filter
xf=filtfilt(b,a,xn);

% Plot time vs amplitude:
figure;
subplot(2,1,1)
plot(t,xn)
title("Noisy signal")
xlabel("Time(s)")
ylabel("Amplitude")

subplot(2,1,2)
plot(t,xf)
title("Filtered signal")
xlabel("Time(s)")
xlabel("Time (s)")
ylabel("Amplitude")

% Plot frequency vs magnitude:
N=length(xn);
f=(0:N-1)*(fs/N);

Xn=abs(fft(xn));
Xf=abs(fft(xf));

figure
plot(f,Xn,f,Xf)
xlim([0 1200])
legend("Noisy","Filtered")
xlabel("Frequency(Hz)")
ylabel("Magnitude")
title("FFT before and after filtering")

% Save figure as png
saveas(gcf,'fft_filtering.png')

