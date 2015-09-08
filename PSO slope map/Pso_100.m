%用粒子群搜索最佳粗避障方向100m
clc;clear all;close all;
tic;                              %程序运行计时
E0=0.1;                        %允许误差
MaxNum=1000;                    %粒子最大迭代次数
narvs=2;                         %目标函数的自变量个数
particlesize=100;                    %粒子群规模
c1=2;                            %每个粒子的个体学习因子，也称为加速常数
c2=1.5;                            %每个粒子的社会学习因子，也称为加速常数
w=0.6;                           %惯性因子
vmax=150;                        %粒子的最大飞翔速度
x=floor(1000*rand(particlesize,narvs));     %粒子所在的位置

v=200*rand(particlesize,narvs);         %粒子的飞翔速度

gaodu=0.1*double(imread('100.tif'));
%目标函数
for i=1:particlesize%粒子群规模
        f(i)=Pbest2(x(i,1),x(i,2),gaodu);
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%返回下标
globalbest_x=personalbest_x(i,:);
k=1;%迭代次数

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest2(x(i,1),x(i,2),gaodu);
        if f(i)<personalbest_faval(i) %判断当前位置是否是历史上最佳位置
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval)
    globalbest_x=personalbest_x(i,:)
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
        x(i,:)=floor(x(i,:)+v(i,:));
        x(x<0)=1500;
    end
    
    if abs(globalbest_faval)<E0,break,end
    k=k+1
end