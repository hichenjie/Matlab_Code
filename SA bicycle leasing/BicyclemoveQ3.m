%经纬度转换
clc;clear all;
d=DmapAll()
%p为概率矩阵
p=zeros(53);
for i=1:53;
    for j=1:53;
        if d(i,j)<=0.5; 
            p(i,j)=0.4551;
        else if d(i,j)<=1.0&&d(i,j)>0.5; 
                p(i,j)=0.2760;
            else if d(i,j)<=1.5&&d(i,j)>1; 
                      p(i,j)=0.1674; 
                else if d(i,j)<=2&&d(i,j)>1.5; 
                      p(i,j)=0.1015;
                    else  if d(i,j)>2
                            p(i,j)=0;
                    end
                    end
                end
            end
        end
    end
end

p1=p;
%求每一个点的输出车辆%把概率矩阵p归一化
for i=1:53;
    for j=1:53;
        p(i,j)=p(i,j)./sum(p1(i,:));
    end
end
%最佳分配
%a=[40,40,40,40,40,36,15,40,29,20,20,39,8,14,40,19,24,26,39,26,17,39,17,38,24,26,39,20,15,20,40,40,40,40,40,40,40,40,40,40,14,17,33,19,9,6,20,24,15,5,29,9,8;];
%b=[40,40,35,40,40,40,38,18,21,40,30,39,31,15,14,7,26,36,22,22,40,7,40,11,15,22,40,22,19,40,40,40,40,40,40,40,40,35,40,19,22,26,31,9,31,8,9,32,24,7,9,14,12;]
c=[40,40,35,40,40,40,38,18,21,40,30,39,31,15,14,7,26,36,22,22,40,7,40,11,15,22,40,22,19,40,39,40,40,40,40,40,40,26,40,8,25,27,40,7,24,14,9,37,22,8,10,16,15;]
%实际需求
%d=[15,23,38,38,17,32,13,40,26,18,18,35,7,12,38,17,21,23,28,23,15,35,15,34,21,23,35,18,13,18,8,8,6,9,11,13,24,18,17,5,12,15,24,17,8,5,18,21,13,4,26,8,4;]
%e=[22,24,28,32,23,12,35,22,19,31,24,20,27,19,16,22,39,38,20,21,33,7,20,9,9,21,30,21,22,30,27,18,19,21,28,9,17,26,12,17,20,23,28,8,28,7,8,29,21,6,8,12,8;]
f=[30,35,31,22,28,10,34,16,19,37,27,33,28,13,12,6,23,32,20,20,34,6,38,10,13,20,35,20,17,38,33,21,12,23,20,9,16,23,8,7,22,24,33,6,21,12,8,33,20,7,9,14,11;]
B1=f;%B1为需求量
B2=c;%B2为分配量
B3=B2-B1;%剩余车辆
%得到1:30个点的输出矩阵
for i=1:53
    for j=1:53
    p(i,j)=B1(i).*p(i,j);%p(i,j)为第i行第j列的输出的自行车值；
    end
end
%得到1:30个点的输出矩阵每一竖列的和值兵他吧赋给B3，得到每个点剩余的车辆数。
for i=1:53
    B3(i)=B3(i)+sum(p(:,i));
end
  %对车辆进行随机取证并保证总量为1458；
   B4=B3-floor(B3)    ;
   B5=B3-floor(B3);
   B5(B5>=0.5)=1;B5(B5<0.5)=0;
    B3=B5+floor(B3);
    while (sum(B3))<1458
        M=max(max(B4));
        [x,y]=find(B4==M);
        B4(x,y)=0;
        if B3(x,y)<40
         B3(x,y)=B3(x,y)+1;
        end
    end
    sum(B3)
   if sum(B3)>1458
       L=randperm(53);
      B3(L(1))= B3(L(1))-1;
   end
       
    sum(B3)

    
