
clc;clear all;close all;
tic;                              %�������м�ʱ
E0=0.01;                        %�������
MaxNum=10000;                    %��������������
narvs=3;                         %Ŀ�꺯�����Ա�������
particlesize=40;                    %����Ⱥ��ģ
c1=2;                            %ÿ�����ӵĸ���ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
c2=2;                            %ÿ�����ӵ����ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
w=0.6;                           %��������
vmax=4000;                        %���ӵ��������ٶ�
x=-40000+80000*rand(particlesize,narvs);     %�������ڵ�λ��

v=10000*rand(particlesize,narvs);         %���ӵķ����ٶ�
%��inline������Ӧ�Ⱥ����Ա㽫�Ӻ����ļ����������ļ�����һ��
%Ŀ�꺯���ǣ�y=1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2))
%inline�������Ӧ�Ⱥ������£�
%fitness=inline('1/(1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2)))','x');
%inline�������Ӧ�Ⱥ�����ʹ���������ٶȴ�󽵵�
for i=1:particlesize%����Ⱥ��ģ
        f(i)=Pbest(x(i,1),x(i,2),x(i,3));
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%�����±�
globalbest_x=personalbest_x(i,:);
k=1;%��������

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest(x(i,1),x(i,2),x(i,3));
        if f(i)<personalbest_faval(i) %�жϵ�ǰλ���Ƿ�����ʷ�����λ��
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
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
        x(i,:)=x(i,:)+v(i,:);
    end
    if abs(globalbest_faval)<E0,break,end
    k=k+1;
end


% Value1=1/globalbest_faval-1; Value1=num2str(Value1);
% % strcatָ�����ʵ���ַ���������
% disp(strcat('the maximum value','=',Value1));
% %������ֵ���ڵĺ�����λ��
% Value2=globalbest_x; Value2=num2str(Value2);
% disp(strcat('the corresponding coordinate','=',Value2));
% x=-5:0.01:5;
% y=2.1*(1-x+2*x.^2).*exp(-x.^2/2);
% plot(x,y,'m-','linewidth',3);
% hold on;
% plot(globalbest_x,1/globalbest_faval-1,'kp','linewidth',4);
% legend('Ŀ�꺯��','�����������ֵ');xlabel('x');ylabel('y');grid on;toc;
