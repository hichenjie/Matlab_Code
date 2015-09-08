clear all
close all
n=1000;
Wuma=zeros(1,9);%软判决
signal=randint(1,n);
signal1=zeros(n,3);
signal2=zeros(n,3);
signal3=zeros(1,n);
signal4=zeros(1,n);
D=[0:1:8]
for N=0:1:8;
    num=0;
    for i=1:1:n;
        if signal(i)==1;
            for j=1:1:3;
                 signal1(i,j)=1;
            end
        else if signal(i)==0;
                for j=1:1:3;
                signal1(i,j)=0;
             end
            end
        end
         signal2(i,:)=awgn(signal1(i,:),N);
         for j=1:1:3;
            if signal2(i,j)<=0.5 signal2(i,j)=0;
            else signal2(i,j)=1;
            end
         end
    end
     for i=1:1:n;
         for j=1:1:n;
        signal3(j)=norm(signal2(i,:)-signal1(j,:));
         end
         
       [x,y]=min(signal3);
       signl4(i)=signal(y);
   
     if(abs(signal4(i)-signal(i))==1);
        num=num+1;
     end
     end
     
 Wuma(N+1)=num./n;
 
end  

          
 semilogy(D,Wuma,'o-r')
title('重复码译码的误码率曲线')
 xlabel('误码率');
 ylabel('信噪比  ')
 grid on

