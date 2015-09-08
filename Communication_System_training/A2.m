  clear all
   close all
   sigma=zeros(1,11)
   d=[0:5:50]
   for D=0:5:50%����������
       m=8;
       fs=2000;
       t=0:1/fs:1;
       x=cos(2*pi*t);
       n=2^m;
       [index,Lx]=quantiz(x,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%����nλ���� 
       Nq=mean((x-Lx).^2);
       So=mean(x.^2);
       sigma(D/5+1)=10.*log10(So./Nq)-D;
   end
plot(d,sigma,'*-')
grid on
hold on
 sigma=zeros(1,11)
   d=[0:5:50]
   for D=0:5:50%����������
       m=12;
       fs=2000;
       t=0:1/fs:1;
       x=cos(2*pi*t);
       n=2^m;
       [index,Lx]=quantiz(x,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%����nλ���� 
       Nq=mean((x-Lx).^2);
       So=mean(x.^2);
       sigma(D/5+1)=10.*log10(So./Nq)-D;
   end
plot(d,sigma,'o-r')
title('������������ź�˥���ı仯���')
hold on


n=8%����������
fs=2000;
t=0:1/fs:1;
x=cos(2*pi*t);
%A��ѹ��
A=87.6;
V=max(x)
for D=0:5:50
    m=8;
    n=2^m
    y=compand(x,A,V,'A/compressor')     
    [index,Lx]=quantiz(y,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%����nλ����
    Nq=mean((y-Lx).^2); 
    So=mean(y.^2)./(10^(D/20));
    sigma(D/5+1)=10.*log10(So./Nq);
end
d=[0:5:50];
plot(d,sigma,'g');
grid on 
y3=6.02*8-d;
plot(d,y3,'-y');
y4=6.02*12-d;
plot(d,y4,'--')


legend('8λ��������','12λ��������','8λ�Ǿ�������','8λ������������ֵ','12λ������������ֵ')
xlabel('db')
ylabel('db')
