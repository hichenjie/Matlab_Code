function f=Molituihuo1()
clear	
clc
a = 0.99;	% �¶�˥�������Ĳ���
t0 = 197; tf = 3; t = t0;
Markov_length = 100000;	% Markov������
% ���÷��������ĳ�ʼֵ[11419.9365458799,343.450999152997,13094.0035090458;]
SolNew1= 1000;
SolNew2= 1000;
SolNew3= 1000;
SolNow1 = SolNew1; SolBest1 = SolNew1;   % sol_new��ÿ�β������½⣻sol_current�ǵ�ǰ�⣻sol_best����ȴ�е���ý⣻
SolNow2 = SolNew2; SolBest2 = SolNew2;
SolNow3 = SolNew3; SolBest3 = SolNew3;
ENow =Best(SolNew1,SolNew2,SolNew3);% E_current�ǵ�ǰ���Ӧ�Ļ�·���룻
EBest = ENow; 		% E_new���½�Ļ�·���룻% E_best�����Ž��
process=[];
while t>=tf

                  EBest
                 SolBest1 
                 SolBest2 
                 SolBest3 
     process=[process;[t,EBest,SolBest1,SolBest2,SolBest3]];
    for i=1:Markov_length
        if rand<0.5
            SolNew1=SolNew1+2*rand();
        else
            SolNew1=SolNew1-2*rand();
        end
        
        if rand<0.5
            SolNew2=SolNew2+2*rand();
        else
            SolNew2=SolNew2-2*rand();
        end
           
        if rand<0.5
           SolNew3=SolNew3+2*rand();
        else
           SolNew3=SolNew3-2*rand();
        end
          
		% ����Ŀ�꺯��ֵ�������ܣ�
		ENew = Best(SolNew1,SolNew2,SolNew3);
        if ENew < ENow
             ENow = ENew;
             SolNow1 = SolNew1;
             SolNow2 = SolNew2;
             SolNow3 = SolNew3;
             if ENew < EBest
                 EBest = ENew;
                 SolBest1 = SolNew1;
                 SolBest2 = SolNew2;
                 SolBest3 = SolNew3;
                
             end
        else
            if rand < exp(-(ENew-ENow)./t)
                ENow = ENew;
                SolNow1 = SolNew1;
                SolNow2 = SolNew2;
                SolNow3 = SolNew3;
            else
                SolNew1 = SolNow1;
                SolNew2 = SolNow2;
                SolNew3 = SolNow3;
            end
                
        end
    end
    t=a*t;
end
 f=process;
end
  
