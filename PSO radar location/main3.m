clc;clear all;close all;
tic;   %�������м�ʱ
nm=30;
E0=0.000001;                        %�������
MaxNum=30000;                    %��������������
narvs=3;                         %Ŀ�꺯�����Ա�������
particlesize=nm;                    %����Ⱥ��ģ
c1=2;                            %ÿ�����ӵĸ���ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
c2=2;                            %ÿ�����ӵ����ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
w=0.6;                           %��������
vmax=300;                        %���ӵ��������ٶ�
x=-10000+200000*rand(particlesize,narvs);     %�������ڵ�λ��
process=[];
v=500*rand(particlesize,narvs);         %���ӵķ����ٶ�
%��inline������Ӧ�Ⱥ����Ա㽫�Ӻ����ļ����������ļ�����һ��
%Ŀ�꺯���ǣ�y=1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2))
%inline�������Ӧ�Ⱥ������£�
%fitness=inline('1/(1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2)))','x');
%inline�������Ӧ�Ⱥ�����ʹ���������ٶȴ�󽵵�
X=x(:,1)';
Y=x(:,2)';
Z=abs(x(:,3)');
scatter3(X,Y,Z,'*','y');

for i=1:particlesize%����Ⱥ��ģ
        f(i)=Pbest3(x(i,1),x(i,2),x(i,3));
end

personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);%�����±�
globalbest_x=personalbest_x(i,:);
k=1;%��������

while k<=MaxNum
    for i=1:particlesize
     f(i)=Pbest3(x(i,1),x(i,2),x(i,3));
        if f(i)<personalbest_faval(i) %�жϵ�ǰλ���Ƿ�����ʷ�����λ��
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
    disp(globalbest_faval)
    
    for i=1:particlesize %��������Ⱥ��ÿ�����������λ��
        v(i,1)=w*v(i,1)+c1*rand*(personalbest_x(i,1)-x(i,1))+c2*rand*(globalbest_x(1,1)-x(i,1));
        v(i,2)=w*v(i,2)+c1*rand*(personalbest_x(i,2)-x(i,2))+c2*rand*(globalbest_x(1,2)-x(i,2));
        v(i,3)=w*v(i,3)+c1*rand*(personalbest_x(i,3)-x(i,3))+c2*rand*(globalbest_x(1,3)-x(i,3));
    end
    for i=1:particlesize
        for j=1:narvs    %�ж����ӵķ����ٶ��Ƿ񳬹����������ٶ�
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
            xlabel('��������')
            ylabel('��������')
            zlabel('�췽��')
          
           end
    if abs(globalbest_faval)<E0,break,end
      process=[process;[k,globalbest_faval]];
    k=k+1;
end



