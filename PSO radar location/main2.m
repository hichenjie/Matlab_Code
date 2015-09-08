
clc;clear all;close all;
process=[];
nm=70
tic;                              %程序运行计时
E0=0.1;                        %允许误差
MaxNum=1000;                    %粒子最大迭代次数
narvs=2;                         %目标函数的自变量个数
particlesize=nm;                    %粒子群规模
c1=2;                            %每个粒子的个体学习因子，也称为加速常数
c2=2;                            %每个粒子的社会学习因子，也称为加速常数
w=0.6;                           %惯性因子
vmax=4000;                        %粒子的最大飞翔速度
x=-40000+80000*rand(particlesize,narvs);     %粒子所在的位置

v=10000*rand(particlesize,narvs);         %粒子的飞翔速度
%用inline定义适应度函数以便将子函数文件与主程序文件放在一起，
%目标函数是：y=1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2))
%inline命令定义适应度函数如下：
%fitness=inline('1/(1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2)))','x');
%inline定义的适应度函数会使程序运行速度大大降低
for i=1:particlesize%粒子群规模
        f(i)=Pbest2(x(i,1),x(i,2),13094.0035102796);
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%返回下标
globalbest_x=personalbest_x(i,:);
k=1;%迭代次数

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest2(x(i,1),x(i,2),13094.0035102796);
        if f(i)<personalbest_faval(i) %判断当前位置是否是历史上最佳位置
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
   % process=[process;[k,personalbest_x,13094.0035102796]];
    [globalbest_faval i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
    disp(globalbest_faval)
    
    for i=1:particlesize %更新粒子群里每个个体的最新位置
        v(i,:)=w*v(i,:)+c1*rand*(personalbest_x(i,:)-x(i,:))...
            +c2*rand*(globalbest_x-x(i,:));
       
        for j=1:narvs    %判断粒子的飞翔速度是否超过了最大飞翔速度
            if v(i,j)>vmax;
                v(i,j)=vmax;
            elseif v(i,j)<-vmax;
                v(i,j)=-vmax;
            end
        end
        x(i,:)=x(i,:)+v(i,:);
    end
     if k ==50
            mp=nm
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp)
            for mn=1:nm
             p(mn)=v(mn,1);
             q(mn)=v(mn,2);
             z(mn)=13094.0035102796;
            end
            scatter3(p,q,z,5,'k');
     end
     hold on
           if k ==300
            mp=nm
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp)
            for mn=1:nm
             p(mn)=v(mn,1);
             q(mn)=v(mn,2);
             z(mn)=13094.0035102796;
            end
            scatter3(p,q,z,'g');
           end
        if  k ==500
            mp=nm
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp)
            for mn=1:nm
             p(mn)=v(mn,1);
             q(mn)=v(mn,2);
             z(mn)=13094.0035102796;
            end
            scatter3(p,q,z,'b');
           end
        if  k ==1000
            mp=nm
            p=zeros(1,mp);
            q=zeros(1,mp);
            z=zeros(1,mp)
            for mn=1:nm
             p(mn)=v(mn,1);
             q(mn)=v(mn,2);
             z(mn)=13094.0035102796;
            end
            scatter3(p,q,z,5,'r');
            xlabel('正东方向')
             ylabel('目标函数')
              zlabel('天方向')
              grid on
           end
    if abs(globalbest_faval)<E0,break,end
   process=[process;[k,globalbest_faval]];
    k=k+1;
    
end

% m=1000;
% p=zeros(1,m);
% q=zeros(1,m);
% z=zeros(1,m);
% for i=1:1000
%     p(i)=process(i,2);
%     q(i)=process(i,3);
%    z(i)=13094;
% end
% plot3(p,q,z,'o')
% 
% plot(p,q,'o')


