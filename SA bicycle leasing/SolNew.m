%计算初值路线********************************
function [way1,way2,way31]=SolNew()
clc
clear

%早-中分配
	Need1=[-1,1,10,9,-2,-12,-13,22,4,-10,-8,-2,-20,-1,18,11,14,10,11,-1,-12,21,-23,22,3,2,5,-5,-5,-14,8,4,-1,-3,11,-12,0,13,-4,23,-7,-4,6,6,-18,-5,-1,3,-5,-18,6,-17,-19];%m点的需求值
%中-晚分配
%	Need1=;
%晚-早分配
%	Need1=;
length=size(Need1,2);
R1=zeros(1,length);
R2=zeros(1,length);
R3=zeros(1,length);

for i=1:10000000
   L=randperm(length);%m长度的随机数组
   L1=randperm(6);
   m=14+L1(1);
   L2=randperm(6);
   n=32+L2(1);
		for i=1:m
        R1(i)=L(i);
        end

        for i=m+1:n
        p=i-m;
		R2(p)=L(i);
		end

		for i=n+1:53
		q=i-n;
		R3(q)=L(i);   
        end
      R1(R1==0)=[];
      R2(R2==0)=[];
      R3(R3==0)=[];
    %约束条件
    K=Q3St(R1,R2,R3,Need1);
	if K==1
		R1
		R2
		R3
		break;
		else continue
	end
end
end
