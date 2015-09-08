clear all
close all

n=8%量化点评数
fs=2000;
t=0:1/fs:1;
x=sin(2*pi*t);
%A律压缩
%A=87.6;
%V=max(x);
%y=compand(x,A,V,'A/compressor')  ; 
%[index,Lx]=quantiz(y,-(n-2)/n:2/n:(n-2)/n,-(n-1)/n:2/n:(n-1)/n);%进行8位量化
Lx=x
yy=zeros(1,2001);
for i=1:1:2001
        if 0/2048<=abs(Lx(i))&&abs(Lx(i))<16/2048 
            yy(i)=floor(Lx(i)*2048)./2048+0.5/2048;
        else    if 16/2048<=abs(Lx(i))&&abs(Lx(i))<32/2048;
            yy(i)=floor(Lx(i)*2048)./2048+0.5/2048 ;
        else if 32/2048<=abs(Lx(i))&&abs(Lx(i))<64/2048
            yy(i)=floor(Lx(i)*2048)./2048+1/2048;
        else if 64/2048<=abs(Lx(i))&&abs(Lx(i))<128/2048
            yy(i)=floor(Lx(i)*2048)./2048+2/2048;           
        else if 128/2048<=abs(Lx(i))&&abs(Lx(i))<256/2048
            yy(i)=floor(Lx(i)*2048)./2048+4/2048;
        else if 256/2048<=abs(Lx(i))&&abs(Lx(i))<512/2048
             yy(i)=floor(Lx(i)*2048)./2048+8/2048;
        else if 512/2048<=abs(Lx(i))&&abs(Lx(i))<1024/2048
             yy(i)=floor(Lx(i)*2048)./2048+16/2048;
        else if 1024/2048<=abs(Lx(i))&&abs(Lx(i))<=2048/2048
             yy(i)=floor(Lx(i)*2048)./2048+32/2048;
        end
        Lx(i)
            end
            end
            end
            end
            end
            end
        end
end
 

figure(1)
plot(t,yy,'r')
hold on
plot(t,x,'g')
title('输入信号与译码输出')
legend('输入信号','量化信号')

figure(2)
derta=yy-x;
plot(t,derta,'g')
title('量化误差')


 

 
