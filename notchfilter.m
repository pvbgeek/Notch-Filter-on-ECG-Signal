clc; 
clear all;
close all;
disp('Section-1 Done');
%%
ecg=load('BEAT_2000_samples.txt');
f_s=250; 

N1=length(ecg);
t=0:1/f_s:7.999;
ecgnew = transpose(ecg);
disp('Section-2 Done')
%%
noise=sin(2*pi*50*t);
xn = ecgnew + noise*25;
disp('Section-3 Done')
%%
load('NUM.mat')
disp('Section-4 Done')
%%
% filtered_ecg = filter(Hd,xn);
% figure
% plot(t(1:500),filtered_ecg(1+30:500+30))
% title('Filtered ecg')
% xlabel('time')
% ylabel('amplitude')
% disp('Section-5 Done')
%%
df=f_s/N1;
frequency_ecg=-f_s/2:df:f_s/2-df;

figure
FFT_ecg_in=fftshift(fft(ecg))/length(fft(ecg));
subplot(3,1,1)
plot(frequency_ecg,abs(FFT_ecg_in));
title('FFT of ECG Input');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

FFT_ecg_in=fftshift(fft(xn))/length(fft(xn));
subplot(3,1,2)
plot(frequency_ecg,abs(FFT_ecg_in));
title('FFT of ECG Noisy');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

FFT_ecg_in=fftshift(fft(filtered_ecg))/length(fft(filtered_ecg));
subplot(3,1,3)
plot(frequency_ecg,abs(FFT_ecg_in));
title('FFT of Filtered ECG');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

disp('Section-6 Done')
%%
figure

subplot(3,1,1)
plot(t(1:500),ecg(1:500));
title('Original ECG')             
xlabel('Time')
ylabel('Amplitude')


subplot(3,1,2)
plot(t(1:500),xn(1:500))
title('Noisy ECG')             
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,3)
plot(t(1:500),filtered_ecg(1+30:500+30))
title('Filtered ECG')             
xlabel('Time')
ylabel('Amplitude')

disp('Section-7 Done')
disp('Code Complete')