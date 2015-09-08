clc;clear all;close all;
tic;   %程序运行计时
nm=30;
E0=0.000001;                        %允许误差
MaxNum=30000;                    %粒子最大迭代次数
narvs=3;                         %目标函数的自变量个数
particlesize=nm;                    %粒子群规模
c1=2;                            %每个粒子的个体学习因子，也称为加速常数
c2=2;                            %每个粒子的社会学习因子，也称为加速常数
w=0.6;                           %惯性因子
vmax=300;                        %粒子的最大飞翔速度
x=-10000+200000*rand(particlesize,narvs);     %粒子所在的位置
process=[];
v=500*rand(particlesize,narvs);         %粒子的飞翔速度
%用inline定义适应度函数以便将子函数文件与主程序文件放在一起，
%目标函数是：y=1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2))
%inline命令定义适应度函数如下：
%fitness=inline('1/(1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2)))','x');
%inline定义的适应度函数会使程序运行速度大大降低
X=x(:,1)';
Y=x(:,2)';
Z=abs(x(:,3)');
scatter3(X,Y,Z,'*','y');

for i=1:particlesize%粒子群规模
        f(i)=Pbest3(x(i,1),x(i,2),x(i,3));
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%返回下标
globalbest_x=personalbest_x(i,:);
k=1;%迭代次数

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest3(x(i,1),x(i,2),x(i,3));
        if f(i)<personalbest_faval(i) %判断当前位置是否是历史上最佳位置
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
    disp(globalbest_faval)
    
    for i=1:particlesize %更新粒子群里每个个体的最新位置
        v(i,1)=w*v(i,1)+c1*rand*(personalbest_x(i,1)-x(i,1))+c2*rand*(globalbest_x(1,1)-x(i,1));
        v(i,2)=w*v(i,2)+c1*rand*(personalbest_x(i,2)-x(i,2))+c2*rand*(globalbest_x(1,2)-x(i,2));
        v(i,3)=w*v(i,3)+c1*rand*(personalbest_x(i,3)-x(i,3))+c2*rand*(globalbest_x(1,3)-x(i,3));
    end
    for i=1:particlesize
        for j=1:narvs    %判断粒子的飞翔速度是否超过了最大飞翔速度
            if v(i,j)>vmax;
                v(i,j)=vmax;
            elseif v(i,j)<-vmax;
                v(i,j)=-vmax;
            end
         x(i,j)=x(i,j)+v(i,j);    
        end
    end
    
    
        if k ==200
            mp=nm;
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp);
            for mn=1:nm
             p(mn)=x(mn,1);
             q(mn)=x(mn,2);
             z(mn)=x(mn,3);
            end
            scatter3(p,q,z,'k','*');
     end
     hold on
           if k ==400
               mp=nm;
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp);
            for mn=1:nm
             p(mn)=x(mn,1);
             q(mn)=x(mn,2);
             z(mn)=x(mn,3);
            end
            scatter3(p,q,z,'g','*');
           end
        if  k ==600
            mp=nm;
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp);
            for mn=1:nm
             p(mn)=x(mn,1);
             q(mn)=x(mn,2);
            z(mn)=x(mn,3);
            end
            scatter3(p,q,z,'b','*');
           end
        if  k ==MaxNum
            mp=nm;
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp);
            for mn=1:nm
             p(mn)=x(mn,1);
             q(mn)=x(mn,2);
             z(mn)=x(mn,3);
            end
            scatter3(p,q,z,'r','*');
            xlabel('正东方向')
            ylabel('正北方向')
            zlabel('天方向')
          
           end
    if abs(globalbest_faval)<E0,break,end
      process=[process;[k,globalbest_faval]];
    k=k+1;
end



