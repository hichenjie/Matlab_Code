%采用模拟退火进行轨道优化问题求解
clear	
	clc
	a = 0.95;	% 温度衰减函数的参数
	t0 = 99; tf = 3; t = t0;
	Markov_length = 1000;	% Markov链长度
    % 设置符合条件的初始值
L=[0 0 0 0 0 0 0 0 0 0  1500 500];
R=[0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55  7500 800];
SolNew1=[[0.100356431989674,0.157079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.504142037508200,0.510865238198015;] 7000 520];
%SolNew1=[[0.100356431989674,0.157079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.554142037508200,0.60865238198015;] 6400 520]

SolNow1 = SolNew1;
SolBest1 = SolNew1;   % sol_new是每次产生的新解；sol_current是当前解；sol_best是冷却中的最好解；
B=[];
ENow =E_current(SolNew1);% E_current是当前解对应的回路距离；
EBest =ENow 	;	% E_new是新解的回路距离；% E_best是最优解的
	t       

	while t>=tf
        
		for r=1:Markov_length		% Markov链长度
			if (rand() < 0.5)	
               
       %    SolNew1(9)=SolNew1(9)+(R(9)-SolNew1(9))*exp(t./t0-1).*rand();
            SolNew1(11)=SolNew1(11)+(R(11)-SolNew1(11))*exp(t./t0-1).*rand();
            SolNew1(12)=SolNew1(12)+(R(12)-SolNew1(12))*exp(t./t0-1).*rand();
            else      
            SolNew1(11)=SolNew1(11)+(L(11)-SolNew1(11))*exp(t./t0-1).*rand();
            SolNew1(12)=SolNew1(12)+(L(12)-SolNew1(12))*exp(t./t0-1).*rand();
           % SolNew1(9)=SolNew1(9)+(L(9)-SolNew1(9))*exp(t./t0-1).*rand();
            end
    %检查是否满足约束
              k=FunSt(SolNew1);
    if k==1
			% 计算目标函数值（即内能）
			ENew = E_current(SolNew1);
			if ENew < ENow
				ENow = ENew;
			SolNow1 = SolNew1;
				if ENew < EBest
% 把冷却过程中最好的解保存下来
					EBest = ENew
                    disp(t);
					SolBest1 = SolNew1
                  
				end
			else
				% 若新解的目标函数值小于当前解的，
				% 则仅以一定概率接受新解
				if rand < exp(-(ENew-ENow)./t)
					ENow = ENew;
					SolNow1 = SolNew1;
				else	
					SolNew1 = SolNow1;
				end
			end
    end
		
        end
    t=t.*a;		% 控制参数t（温度）减少为原来的a倍
      B=[B [EBest;t] ];
   end
  
	disp('最优解为：')
	disp(SolBest1)
	disp('最小燃料消耗：')
	disp(EBest)
   
    
    
    