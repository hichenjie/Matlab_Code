 
fm=1000;%信号频率
fc=10000;%载波频率
fs=12.8*fc;%抽样频率
N=1024; %采样点数

t=[0:N-1]/fs; %时域采样点
T=N/fs; %截止时间
f=-fs/2+[0:N-1]/T; %频域采样点

%AM调制
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

s_am=(1+s_m).*s_c;
subplot(3,2,3);
plot(f,s_am);%AM信号时域波形
xlabel('s');
ylabel('AM(t)');
title('AM调制信号AM(t)时域波形图')
S_AM=fftshift(fft(s_am));
subplot(3,2,4);
plot(f,S_AM);%AM信号频域波形
xlabel('HZ');
ylabel('AM(f)');
title('AM调制信号AM(t)频域波形图')

ri_am=awgn(s_am,20).*2.*cos(2*pi*fc*t);

S_AM=fftshift(fft(s_am));


 wc=1.5*2*pi*fm/fs;
 B=fir1(128,wc/pi);
 
roam=filter(B,1, ri_am);
S_roam=fftshift(fft(roam));

subplot(3,2,5);
plot(f,roam);%ro信号时域波形
xlabel('s');
ylabel('ro_AM(t)');
title('解调输出信号ro_AM(t)时域波形图')
subplot(3,2,6);
plot(f,abs(S_roam));%AM信号频域波形
xlabel('HZ');
ylabel('ro_AM(f)');
title('解调输出信号ro_AM(f)频域波形图')
