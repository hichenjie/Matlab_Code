clear all
close all

n=8%量化点评数
fs=32;
t=0:1/fs:1;
x=cos(2*pi*t);
%A律压缩
A=87.6;
V=max(x)
y=compand(x,A,V,'A/compressor')     
figure(1)
stem(t,y,'*g')   
hold on 
[index,Lx]=quantiz(y,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%进行n位量化
stem(t,Lx,'r')
grid on 
title('输入信号8级均匀量化以及A律压缩');
%a=log(A)
%y=zeros(1,33);
%for i=1:1:33
%        if abs(x(i))<=1/A
%             y(i)=abs(x(i)).*A./(1+a);
%        else
%        y(i)=(1+log(A.*abs(x(i))))./(1+a);
%        end
%end  
legend('8位均匀量化','压缩后波形图')
figure(2)
title('A律压缩前后波形图')
plot(t,x,'r')
hold on
plot(t,y,'g')
grid on
legend('压缩前波形','A律压缩后波形')
figure(3)
derta=Lx-y;
stem(t,derta,'o')
title('A律量化误差')
grid on
 