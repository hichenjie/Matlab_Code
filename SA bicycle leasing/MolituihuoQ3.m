%采用模拟退火进行对调度问题优化
clear	
	clc
	a = 0.99;	% 温度衰减函数的参数
	t0 = 77; tf = 3; t = t0;
	Markov_length = 100000;	% Markov链长度
    d=DmapAll();
    amount=size(d,1);
  % 设置符合条件的初始值
 %早到中
Need=[-1,1,10,9,-2,-12,-13,22,4,-10,-8,-2,-20,-1,18,11,14,10,11,-1,-12,21,-23,22,3,2,5,-5,-5,-14,8,4,-1,-3,11,-12,0,13,-4,23,-7,-4,6,6,-18,-5,-1,3,-5,-18,6,-17,-19;];
SolNew1= [ 39    42    38    50     9    43    20    19    53    45    37    35    26    34    32    23    18];
SolNew2=[ 11    51    40    36    30     8     4    16    49     3    29    17    28    21     6    46     2    12];
SolNew3=[7    27    33    41    24    15     1    47    52    14    22    25     5    10    31    48    44   13];
 %中到晚
 %Need=[5,0,-6,-10,6,8,-10,2,7,-8,-9,0,-2,2,13,6,-16,-16,11,9,-7,8,2,-2,7,3,-6,3,6,-6,-0];
 %SolNew1=[   20    16    26     9     2    30     7     6    11    22    13    24    27     3     ];
 %SolNew2=[    15     8    29    12    28    17    25    10    21     5     1     4    14    19    23 18 ];
  %晚到早
 %Need=[-5,-11,-16,-2,0,14,16,-12,2,9,0,-11,21,9,-9,9,0,-1,-7,5,15,-23,8,-28,-5,2,-8,8,12,8,0];
 %SolNew1=[    21     4    13    11    16    22     9    15    10     6    24    27       ];
 %SolNew2=[     26    17     7    30     3    28    25    14    18    20     8    19    23    29   1     5     2    12       ];
  SolNow1 = SolNew1; SolBest1 = SolNew1;   % sol_new是每次产生的新解；sol_current是当前解；sol_best是冷却中的最好解；
  SolNow2 = SolNew2; SolBest2 = SolNew2;
  SOlNow3 = SolNew3; SolBest3 = SolNew3;
  ENow =Enow(SolNew1,SolNew2,SolNew3,Need,d);% E_current是当前解对应的回路距离；
  EBest =ENow 		% E_new是新解的回路距离；% E_best是最优解的
	t       

	while t>=tf
        
		for r=1:Markov_length		% Markov链长度
			
            % 产生随机扰动
			
            L=randperm(53);%获得一个1:30的随机整数组,这里设置两个量
            SolNew1(SolNew1==L(1))=[];
            SolNew2(SolNew2==L(1))=[];
            SolNew1(SolNew1==L(2))=[];
            SolNew2(SolNew2==L(2))=[];
            SolNew3(SolNew1==L(2))=[];
            SolNew3(SolNew2==L(2))=[];
                for j=1:3
                 if (rand < 0.33)
                     l1size=size(SolNew1,2);
                     n1=l1size+1;
                     cl=randperm(n1);
                        if  cl(1)==1
                            SolNew1=[L(j), SolNew1];
                        else if cl(1)==l1size
                              SolNew1=[SolNew1, L(j)];  
                            else
                                n1=cl(1)-1;
                                SolNew1=[SolNew1(:,1:n1), L(j), SolNew1(:,cl(1):l1size)];
                            end
                        end
                 end
                 if   (rand > 0.66)
                      l2size=size(SolNew2,2);
                      n2=l2size+1;
                     cl=randperm(n2);
                        if  cl(1)==1
                            SolNew2=[L(j), SolNew2];
                        else if cl(1)==l2size
                               SolNew2=[SolNew2, L(j)]; 
                            else
                                 n1=cl(1)-1;n2=cl(1)+1;n3=l2size+1;
                                SolNew2=[SolNew2(:,1:n1) ,L(j) ,SolNew2(:,cl(1):l2size)];
                            end
                        end
                 else
                     l2size=size(SolNew2,2);
                      n2=l2size+1;
                     cl=randperm(n2);
                        if  cl(1)==1
                            SolNew2=[L(j), SolNew2];
                        else if cl(1)==l2size
                               SolNew2=[SolNew2, L(j)]; 
                            else
                                 n1=cl(1)-1;n2=cl(1)+1;n3=l2size+1;
                                SolNew2=[SolNew2(:,1:n1) ,L(j) ,SolNew2(:,cl(1):l2size)];
                            end
                        end
                 end
                
                end
         
    
        
                
    %检查是否满足约束
    k=Q3St(SolNew1,SolNew2,SolNew3,Need);
    if k==1
			% 计算目标函数值（即内能）
			ENew = E_current(SolNew1,SolNew2,Need,d);
			
			if ENew < ENow
				ENow = ENew;
			SolNow1 = SolNew1;
            SolNow2 = SolNew2;
              SolNow3 = SolNew3;
				if ENew < EBest
% 把冷却过程中最好的解保存下来
					EBest = ENew
                    disp(t);
					SolBest1 = SolNew1
                    SolBest2 = SolNew2
                    SolBest3 = SolNew3
				end
			else
				% 若新解的目标函数值小于当前解的，
				% 则仅以一定概率接受新解
				if rand < exp(-(ENew-ENow)./t)
					ENow = ENew;
					SolNow1 = SolNew1;
                    SolNow2 = SolNew2;
                    SolNow3 = SolNew3;
				else	
					SolNew1 = SolNow2;
                    SolNow2 = SolNew1;
                    SolNow3 = SolNew3;
				end
			end
    end
		
        end
    t=t.*a;		% 控制参数t（温度）减少为原来的a倍
   end
  
	disp('最优解路线一为：')
	disp(SolBest1)
    disp('最优解路线二为：')
    disp(SolBest2)
	disp('最小时间：')
	disp(EBest)
