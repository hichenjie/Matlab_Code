%������Ⱥ������Ѵֱ��Ϸ���100m
clc;clear all;close all;
tic;                              %�������м�ʱ
E0=0.1;                        %�������
MaxNum=1000;                    %��������������
narvs=2;                         %Ŀ�꺯�����Ա�������
particlesize=100;                    %����Ⱥ��ģ
c1=2;                            %ÿ�����ӵĸ���ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
c2=1.5;                            %ÿ�����ӵ����ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
w=0.6;                           %��������
vmax=150;                        %���ӵ��������ٶ�
x=floor(1000*rand(particlesize,narvs));     %�������ڵ�λ��

v=200*rand(particlesize,narvs);         %���ӵķ����ٶ�

gaodu=0.1*double(imread('100.tif'));
%Ŀ�꺯��
for i=1:particlesize%����Ⱥ��ģ
        f(i)=Pbest2(x(i,1),x(i,2),gaodu);
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%�����±�
globalbest_x=personalbest_x(i,:);
k=1;%��������

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest2(x(i,1),x(i,2),gaodu);
        if f(i)<personalbest_faval(i) %�жϵ�ǰλ���Ƿ�����ʷ�����λ��
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval)
    globalbest_x=personalbest_x(i,:)
    disp(globalbest_faval)
    
    for i=1:particlesize %��������Ⱥ��ÿ�����������λ��
        v(i,:)=w*v(i,:)+c1*rand*(personalbest_x(i,:)-x(i,:))...
            +c2*rand*(globalbest_x-x(i,:));
        for j=1:narvs    %�ж����ӵķ����ٶ��Ƿ񳬹����������ٶ�
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