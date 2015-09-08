 
fm=1000;%�ź�Ƶ��
fc=10000;%�ز�Ƶ��
fs=12.8*fc;%����Ƶ��
N=4096; %��������

t=[0:N-1]/fs; %ʱ�������
T=N/fs; %��ֹʱ��
f=-fs/2+[0:N-1]/T; %Ƶ�������

%DSB����
figure(1)
s_m=cos(2*pi*fm*t);
subplot(3,2,1);
plot(t,s_m);%�����ź�ʱ����
xlabel('s');
ylabel('m(t)');
title('�����ź�m(t)ʱ����ͼ')
subplot(3,2,2);
plot(f,fftshift(fft(s_m)));%�����ź�Ƶ����
xlabel('HZ');
ylabel('m(f)');
title('�����ź�m(t)Ƶ����ͼ')

s_c=cos(2*pi*fc*t);

s_dsb=s_m.*s_c;
subplot(3,2,3);
plot(f,s_dsb);%AM�ź�ʱ����
xlabel('s');
ylabel('DSB(t)');
title('DSB�����ź�DSB(t)ʱ����ͼ')
S_dsb=fftshift(fft(s_dsb));
subplot(3,2,4);
plot(f,S_dsb);%AM�ź�Ƶ����
xlabel('HZ');
ylabel('DSB(f)');
title('DSB�����ź�DSB(t)Ƶ����ͼ')

ri_dsb=awgn(s_dsb,30).*2.*cos(2*pi*fc*t);

S_dsb=fftshift(fft(s_dsb));


 wc=1.5*2*pi*fm/fs;
 B=fir1(128,wc/pi);
 
rodsb=filter(B,1, ri_dsb);
S_rodsb=fftshift(fft(rodsb));

subplot(3,2,5);
plot(f,rodsb);%ro�ź�ʱ����
xlabel('s');
ylabel('ro_DSB(t)');
title('��������ro_DSB(t)ʱ����ͼ')
subplot(3,2,6);
plot(f,abs(S_rodsb));%AM�ź�Ƶ����
xlabel('HZ');
ylabel('ro_DSB(f)');
title('�������ź�ro_DSB(f)Ƶ����ͼ')
