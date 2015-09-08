
fm=1000;%�ź�Ƶ��
fc=10000;%�ز�Ƶ��
fs=12.8*fc;%����Ƶ��
N=4096; %��������

t=[0:N-1]/fs; %ʱ�������
T=N/fs; %��ֹʱ��
f=-fs/2+[0:N-1]/T; %Ƶ�������

%DSB����

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
title('�����������pi/8ʱ�����ro_DSB(t)ʱ����ͼ')


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
title('�����������pi/4ʱ�����ro_DSB(t)ʱ����ͼ')
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
title('�����������pi/3ʱ�����ro_DSB(t)ʱ����ͼ')
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
title('�����������pi/2ʱ�����ro_DSB(t)ʱ����ͼ')