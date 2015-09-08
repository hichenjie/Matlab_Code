n=100000;
p=[0.01,0.1,0.5,1]%信道误码率
Wuma=zeros(1,4);
signal=randint(1,n);
signal1=zeros(n,5);
signal3=zeros(1,n);
for k=1:4
    num=0;
    for i=1:1:n;
         if signal(i)==1 ;
             for j=1:1:5;
                    if rand()<p(k)  signal1(i,j)=0;
                    else signal1(i,j)=1;
                    end 
             end
         end
         if signal(i)==0
             for j=1:1:5;
                    if rand()<p(k)  signal1(i,j)=1;
                    else signal1(i,j)=0;
                    end 
           
             end
         end   
 if length(find(signal1(i,:)==0))<3;
    signal3(i)=1;
 else signal3(i)=0;
 end
    if(abs(signal3(i)-signal(i))==1)
        num=num+1;
    end
     end
     Wuma(k)=num./n  
end
%X=log10(p);
%Y=log10(Wuma)
loglog(p,Wuma,'o-r')
title('信道误码率与重复码译码的误码率曲线')
xlabel('信道误码率');
ylabel('重复码译码的误码率')
grid on



    