clear all
close all

n=8%����������
fs=32;
t=0:1/fs:1;
x=cos(2*pi*t);
%A��ѹ��
A=87.6;
V=max(x)
y=compand(x,A,V,'A/compressor')     
figure(1)
stem(t,y,'*g')   
hold on 
[index,Lx]=quantiz(y,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%����nλ����
stem(t,Lx,'r')
grid on 
title('�����ź�8�����������Լ�A��ѹ��');
%a=log(A)
%y=zeros(1,33);
%for i=1:1:33
%        if abs(x(i))<=1/A
%             y(i)=abs(x(i)).*A./(1+a);
%        else
%        y(i)=(1+log(A.*abs(x(i))))./(1+a);
%        end
%end  
legend('8λ��������','ѹ������ͼ')
figure(2)
title('A��ѹ��ǰ����ͼ')
plot(t,x,'r')
hold on
plot(t,y,'g')
grid on
legend('ѹ��ǰ����','A��ѹ������')
figure(3)
derta=Lx-y;
stem(t,derta,'o')
title('A���������')
grid on
 