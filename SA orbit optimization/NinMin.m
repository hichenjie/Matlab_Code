%灵敏度误差分析
S=[[0.100356431989674,0.18079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.504142037508200,0.63865238198015;] 5795 517]
s=[0.100356431989674,0.18079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.504142037508200,0.63865238198015;]
x=0.1:0.1:1;
x=S(12).*x;
plot(x,s,'r');
ylabel('推力方向角度（rad）')
xlabel('时间')

%图一标准
u=1;
r=zeros(1,10);
theata=zeros(1,10);
v=zeros(1,10);
omg=zeros(1,10);
m=zeros(1,10);
r(1,1)=1;
theata(1,1)=0;
v(1,1)=0;
omg(1,1)=1.0123078;
m(1,1)=1;
F=S(11)./7500;
t=S(12)./1047.6301./9;
for i=2:10
    m(i)=m(i-1)-F.*t./1.7574937;
    r(i)=r(i-1)-v(i-1).*t;
    v(i)=v(i-1)+(F.*sin(S(i-1))./m(i-1)-u./(r(i-1).^2)+r(i-1).*omg(i-1).^2).*t;
    theata(i)=theata(i-1)+omg(i-1).*t;
    omg(i)=omg(i-1)-(F./m(i-1).*cos(S(i-1))+2.*v(i-1).*omg(i-1)).*t./r(i-1);   
    
end

% hold on
% r=r*1752;
% x=0.1:0.1:1;
% x=S(12).*x;
% plot(x,r,'r');
% ylabel('月心距离（km）')
% xlabel('时间（s）')

% hold on;
% v=-1*v*1672.3584;
% x=0.1:0.1:1;
% x=S(12).*x;
% plot(x,v,'r');
% ylabel('径向速度（m/s）')
% xlabel('时间（s）')
% %*************************************************************
% %图10%标准
% u=1;
% r1=zeros(1,10);
% theata1=zeros(1,10);
% v1=zeros(1,10);
% omg1=zeros(1,10);
% m1=zeros(1,10);
% r1(1,1)=1*1.1;
% theata1(1,1)=0;
% v1(1,1)=0;
% omg1(1,1)=1.0123078;
% m1(1,1)=1;
% F1=S(11)./7500;
% t1=S(12)./1047.6301./9;
% for i=2:10
%     m1(i)=m1(i-1)-F1.*t1./1.7574937;
%     r1(i)=r1(i-1)-v1(i-1).*t;
%     v1(i)=v1(i-1)+(F1.*sin(S(i-1))./m(i-1)-u./(r1(i-1).^2)+r1(i-1).*omg1(i-1).^2).*t1;
%     theata1(i)=theata1(i-1)+omg(i-1).*t;
%     omg1(i)=omg1(i-1)-(F1./m1(i-1).*cos(S(i-1))+2.*v1(i-1).*omg1(i-1)).*t1./r1(i-1);   
%     
% end
% % wucha=sum(abs(r1*1752-r))./10
% % Nmd=wucha./1752./0.1
% % r=r1*1752;
% % x=0.1:0.1:1;
% % x=S(12).*x;
% % plot(x,r,'b');
% % ylabel('月心距离（km）')
% % xlabel('时间（s）')
% 
% wucha=sum(abs(v1*1672.3584+v))./10
% Nmd=wucha./1672.3584/0.1
% hold on;
% v1=-1*v1*1672.3584;
% x=0.1:0.1:1;
% x=S(12).*x;
% plot(x,v1,'b');
% ylabel('径向速度（m/s）')
% xlabel('时间（s）')
% %***************************************************
% %图5%标准
% u=1;
% r1=zeros(1,10);
% theata1=zeros(1,10);
% v1=zeros(1,10);
% omg1=zeros(1,10);
% m1=zeros(1,10);
% r1(1,1)=1*1.05;
% theata1(1,1)=0;
% v1(1,1)=0;
% omg1(1,1)=1.0123078;
% m1(1,1)=1;
% F1=S(11)./7500;
% t1=S(12)./1047.6301./9;
% for i=2:10
%     m1(i)=m1(i-1)-F1.*t1./1.7574937;
%     r1(i)=r1(i-1)-v1(i-1).*t;
%     v1(i)=v1(i-1)+(F1.*sin(S(i-1))./m(i-1)-u./(r1(i-1).^2)+r1(i-1).*omg1(i-1).^2).*t1;
%     theata1(i)=theata1(i-1)+omg(i-1).*t;
%     omg1(i)=omg1(i-1)-(F1./m1(i-1).*cos(S(i-1))+2.*v1(i-1).*omg1(i-1)).*t1./r1(i-1);   
%     
% end
% % wucha=sum(abs(r1*1752-r))./10
% % Nmd=wucha./1752./0.05
% % r=r1*1752;
% % x=0.1:0.1:1;
% % x=S(12).*x;
% % plot(x,r,'y');
% % ylabel('月心距离（km）')
% % xlabel('时间（s）')
% % % 
% wucha=sum(abs(v1*1672.3584+v))./10
% Nmd=wucha./1672.3584/0.05
% v1=-1*v1*1672.3584;
% x=0.1:0.1:1;
% x=S(12).*x;
% plot(x,v1,'y');
% ylabel('径向速度（m/s）')
% xlabel('时间（s）')
% 

% x=0.1:0.1:1;
% x=S(12).*x;
% plot(x,theata);
% ylabel('theata（rad）')
% xlabel('时间（s）')

omg=omg*1.0123078;
x=0.1:0.1:1;
x=S(12).*x;
plot(x,omg);
ylabel('角速度（rad/s）')
xlabel('时间（s）')


