function f=Molituihuo1()
clear	
clc
a = 0.99;	% 温度衰减函数的参数
t0 = 197; tf = 3; t = t0;
Markov_length = 100000;	% Markov链长度
% 设置符合条件的初始值[11419.9365458799,343.450999152997,13094.0035090458;]
SolNew1= 1000;
SolNew2= 1000;
SolNew3= 1000;
SolNow1 = SolNew1; SolBest1 = SolNew1;   % sol_new是每次产生的新解；sol_current是当前解；sol_best是冷却中的最好解；
SolNow2 = SolNew2; SolBest2 = SolNew2;
SolNow3 = SolNew3; SolBest3 = SolNew3;
ENow =Best(SolNew1,SolNew2,SolNew3);% E_current是当前解对应的回路距离；
EBest = ENow; 		% E_new是新解的回路距离；% E_best是最优解的
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
          
		% 计算目标函数值（即内能）
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
  
