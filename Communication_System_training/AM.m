 
fm=1000;%�ź�Ƶ��
fc=10000;%�ز�Ƶ��
fs=12.8*fc;%����Ƶ��
N=1024; %��������

t=[0:N-1]/fs; %ʱ�������
T=N/fs; %��ֹʱ��
f=-fs/2+[0:N-1]/T; %Ƶ�������

%AM����
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

s_am=(1+s_m).*s_c;
subplot(3,2,3);
plot(f,s_am);%AM�ź�ʱ����
xlabel('s');
ylabel('AM(t)');
title('AM�����ź�AM(t)ʱ����ͼ')
S_AM=fftshift(fft(s_am));
subplot(3,2,4);
plot(f,S_AM);%AM�ź�Ƶ����
xlabel('HZ');
ylabel('AM(f)');
title('AM�����ź�AM(t)Ƶ����ͼ')

ri_am=awgn(s_am,20).*2.*cos(2*pi*fc*t);

S_AM=fftshift(fft(s_am));


 wc=1.5*2*pi*fm/fs;
 B=fir1(128,wc/pi);
 
roam=filter(B,1, ri_am);
S_roam=fftshift(fft(roam));

subplot(3,2,5);
plot(f,roam);%ro�ź�ʱ����
xlabel('s');
ylabel('ro_AM(t)');
title('�������ź�ro_AM(t)ʱ����ͼ')
subplot(3,2,6);
plot(f,abs(S_roam));%AM�ź�Ƶ����
xlabel('HZ');
ylabel('ro_AM(f)');
title('�������ź�ro_AM(f)Ƶ����ͼ')
