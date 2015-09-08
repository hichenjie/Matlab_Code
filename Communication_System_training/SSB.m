
fm=1000;%信号频率
fc=10000;%载波频率
fs=12.8*fc;%抽样频率
N=4096; %采样点数

t=[0:N-1]/fs; %时域采样点
T=N/fs; %截止时间
f=-fs/2+[0:N-1]/T; %频域采样点

%SSB调制
figure(1)
s_m=cos(2*pi*fm*t);
subplot(3,2,1);
plot(t,s_m);%调制信号时域波形
xlabel('s');
ylabel('m(t)');
title('调制信号m(t)时域波形图')
subplot(3,2,2);
plot(f,fftshift(fft(s_m)));%调制信号频域波形
xlabel('HZ');
ylabel('m(f)');
title('调制信号m(t)频域波形图')

s_c=cos(2*pi*fc*t);
m1=sin(2*pi*fm*t);
cq=sin(2*pi*fc*t);
s_ssb=0.5.*s_m.*s_c-0.5.*m1.*cq;

subplot(3,2,3);
plot(f,s_ssb);%AM信号时域波形
xlabel('s');
ylabel('SSB(t)');
title('SSB调制信号SSB(t)时域波形图')
S_ssb=fftshift(fft(s_ssb));
subplot(3,2,4);
plot(f,S_ssb);%AM信号频域波形
xlabel('HZ');
ylabel('SSB(f)');
title('SSB调制信号SSB(t)频域波形图')

ri_ssb=awgn(s_ssb,30).*2.*cos(2*pi*fc*t);

S_ssb=fftshift(fft(s_ssb));


 wc=1.5*2*pi*fm/fs;
 B=fir1(128,wc/pi);
 
rossb=filter(B,1, ri_ssb);
S_rossb=fftshift(fft(rossb));

subplot(3,2,5);
plot(f,rossb);%ri信号时域波形
xlabel('s');
ylabel('ro_SSB(t)');
title('解调输出信ro_SSB(t)时域波形图')
subplot(3,2,6);
plot(f,abs(S_rossb));%AM信号频域波形
xlabel('HZ');
ylabel('ro_SSB(f)');
title('解调输出信号ro_SSB(f)频域波形图')