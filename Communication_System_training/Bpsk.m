clear all
 close all
N1=50;%采样点数
N2=5;%符号葛素
N3=2^16;

singal1=[-1 -1 1 -1 -1];%冲击
singal2=rectpulse(singal1,N1);%矩形波
window=boxcar(length(singal2));
[pxx,f]=periodogram(singal2,window,N3,N2);

figure(1);
D=[-(N1*N2)/2:1:N1*N2./2-1];
plot(D,singal2);
axis([-150 150 -2 2]);
title('基带信号波形图')
grid on

figure(2);
plot(f,pxx);
axis([-4 4 0 40]);
title('基带信号功率谱');
grid on ;
hold on ;
plot(-f,pxx);

figure(3)
fs=50;
t=0:1/fs:5-1/fs;
fc=3
S1=cos(2.*pi.*fc.*t).*singal2;
plot(S1)
grid on;
title('BPSK时域波形图')


figure(4)
window=boxcar(length(S1));
[pxx2,f2]=periodogram(S1,window,N3,N2);
plot(f2,pxx2);
axis([-4 4 0 10]);
title('BPSK功率谱');
grid on ;
hold on ;
plot(-f2,pxx2);





