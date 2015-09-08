
fm=1000;%信号频率
fc=10000;%载波频率
fs=12.8*fc;%抽样频率
N=4096; %采样点数

t=[0:N-1]/fs; %时域采样点
T=N/fs; %截止时间
f=-fs/2+[0:N-1]/T; %频域采样点

%DSB调制

s_m=cos(2*pi*fm*t);
s_c=cos(2*pi*fc*t);
s_dsb=s_m.*s_c;

ri_dsb=awgn(s_dsb,30).*2.*cos(2*pi*fc*t+pi/8);
S_dsb=fftshift(fft(s_dsb));
wc=1.5*2*pi*fm/fs;
B=fir1(128,wc/pi);
rodsb=filter(B,1, ri_dsb);
S_rodsb=fftshift(fft(rodsb));
subplot(2,2,1);
plot(t,rodsb)
xlabel('s');
ylabel('ro_DSB(t)');
title('解调非相干相差pi/8时输出信ro_DSB(t)时域波形图')


ri_dsb=awgn(s_dsb,30).*2.*cos(2*pi*fc*t+pi/4);
S_dsb=fftshift(fft(s_dsb));
wc=1.5*2*pi*fm/fs;
B=fir1(128,wc/pi);
rodsb=filter(B,1, ri_dsb);
S_rodsb=fftshift(fft(rodsb));
subplot(2,2,2);
plot(t,rodsb)
xlabel('s');
ylabel('ro_DSB(t)');
title('解调非相干相差pi/4时输出信ro_DSB(t)时域波形图')
ri_dsb=awgn(s_dsb,30).*2.*cos(2*pi*fc*t+pi/3);
S_dsb=fftshift(fft(s_dsb));
wc=1.5*2*pi*fm/fs;
B=fir1(128,wc/pi);
rodsb=filter(B,1, ri_dsb);
S_rodsb=fftshift(fft(rodsb));
subplot(2,2,3);
plot(t,rodsb)
xlabel('s');
ylabel('ro_DSB(t)');
title('解调非相干相差pi/3时输出信ro_DSB(t)时域波形图')
ri_dsb=awgn(s_dsb,30).*2.*cos(2*pi*fc*t+pi/2);
S_dsb=fftshift(fft(s_dsb));
wc=1.5*2*pi*fm/fs;
B=fir1(128,wc/pi);
rodsb=filter(B,1, ri_dsb);
S_rodsb=fftshift(fft(rodsb));
subplot(2,2,4);
plot(t,rodsb)
xlabel('s');
ylabel('ro_DSB(t)');
title('解调非相干相差pi/2时输出信ro_DSB(t)时域波形图')