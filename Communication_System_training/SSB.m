
fm=1000;%�ź�Ƶ��
fc=10000;%�ز�Ƶ��
fs=12.8*fc;%����Ƶ��
N=4096; %��������

t=[0:N-1]/fs; %ʱ�������
T=N/fs; %��ֹʱ��
f=-fs/2+[0:N-1]/T; %Ƶ�������

%SSB����
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
m1=sin(2*pi*fm*t);
cq=sin(2*pi*fc*t);
s_ssb=0.5.*s_m.*s_c-0.5.*m1.*cq;

subplot(3,2,3);
plot(f,s_ssb);%AM�ź�ʱ����
xlabel('s');
ylabel('SSB(t)');
title('SSB�����ź�SSB(t)ʱ����ͼ')
S_ssb=fftshift(fft(s_ssb));
subplot(3,2,4);
plot(f,S_ssb);%AM�ź�Ƶ����
xlabel('HZ');
ylabel('SSB(f)');
title('SSB�����ź�SSB(t)Ƶ����ͼ')

ri_ssb=awgn(s_ssb,30).*2.*cos(2*pi*fc*t);

S_ssb=fftshift(fft(s_ssb));


 wc=1.5*2*pi*fm/fs;
 B=fir1(128,wc/pi);
 
rossb=filter(B,1, ri_ssb);
S_rossb=fftshift(fft(rossb));

subplot(3,2,5);
plot(f,rossb);%ri�ź�ʱ����
xlabel('s');
ylabel('ro_SSB(t)');
title('��������ro_SSB(t)ʱ����ͼ')
subplot(3,2,6);
plot(f,abs(S_rossb));%AM�ź�Ƶ����
xlabel('HZ');
ylabel('ro_SSB(f)');
title('�������ź�ro_SSB(f)Ƶ����ͼ')