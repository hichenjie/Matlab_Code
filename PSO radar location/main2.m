
clc;clear all;close all;
process=[];
nm=70
tic;                              %�������м�ʱ
E0=0.1;                        %�������
MaxNum=1000;                    %��������������
narvs=2;                         %Ŀ�꺯�����Ա�������
particlesize=nm;                    %����Ⱥ��ģ
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
        f(i)=Pbest2(x(i,1),x(i,2),13094.0035102796);
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%�����±�
globalbest_x=personalbest_x(i,:);
k=1;%��������

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest2(x(i,1),x(i,2),13094.0035102796);
        if f(i)<personalbest_faval(i) %�жϵ�ǰλ���Ƿ�����ʷ�����λ��
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
   % process=[process;[k,personalbest_x,13094.0035102796]];
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
            xlabel('��������')
             ylabel('Ŀ�꺯��')
              zlabel('�췽��')
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


