clear all
 close all
N1=50;%��������
N2=5;%���Ÿ���
N3=2^16;

singal1=[-1 -1 1 -1 -1];%���
singal2=rectpulse(singal1,N1);%���β�
window=boxcar(length(singal2));
[pxx,f]=periodogram(singal2,window,N3,N2);

figure(1);
D=[-(N1*N2)/2:1:N1*N2./2-1];
plot(D,singal2);
axis([-150 150 -2 2]);
title('�����źŲ���ͼ')
grid on

figure(2);
plot(f,pxx);
axis([-4 4 0 40]);
title('�����źŹ�����');
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
title('BPSKʱ����ͼ')


figure(4)
window=boxcar(length(S1));
[pxx2,f2]=periodogram(S1,window,N3,N2);
plot(f2,pxx2);
axis([-4 4 0 10]);
title('BPSK������');
grid on ;
hold on ;
plot(-f2,pxx2);





