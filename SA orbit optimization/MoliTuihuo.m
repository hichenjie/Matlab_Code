%����ģ���˻���й���Ż��������
clear	
	clc
	a = 0.95;	% �¶�˥�������Ĳ���
	t0 = 99; tf = 3; t = t0;
	Markov_length = 1000;	% Markov������
    % ���÷��������ĳ�ʼֵ
L=[0 0 0 0 0 0 0 0 0 0  1500 500];
R=[0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55  7500 800];
SolNew1=[[0.100356431989674,0.157079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.504142037508200,0.510865238198015;] 7000 520];
%SolNew1=[[0.100356431989674,0.157079632679490,0.213802833369305,0.270526034059121,0.327249234748937,0.383972435438753,0.440695636128568,0.497418836818384,0.554142037508200,0.60865238198015;] 6400 520]

SolNow1 = SolNew1;
SolBest1 = SolNew1;   % sol_new��ÿ�β������½⣻sol_current�ǵ�ǰ�⣻sol_best����ȴ�е���ý⣻
B=[];
ENow =E_current(SolNew1);% E_current�ǵ�ǰ���Ӧ�Ļ�·���룻
EBest =ENow 	;	% E_new���½�Ļ�·���룻% E_best�����Ž��
	t       

	while t>=tf
        
		for r=1:Markov_length		% Markov������
			if (rand() < 0.5)	
               
       %    SolNew1(9)=SolNew1(9)+(R(9)-SolNew1(9))*exp(t./t0-1).*rand();
            SolNew1(11)=SolNew1(11)+(R(11)-SolNew1(11))*exp(t./t0-1).*rand();
            SolNew1(12)=SolNew1(12)+(R(12)-SolNew1(12))*exp(t./t0-1).*rand();
            else      
            SolNew1(11)=SolNew1(11)+(L(11)-SolNew1(11))*exp(t./t0-1).*rand();
            SolNew1(12)=SolNew1(12)+(L(12)-SolNew1(12))*exp(t./t0-1).*rand();
           % SolNew1(9)=SolNew1(9)+(L(9)-SolNew1(9))*exp(t./t0-1).*rand();
            end
    %����Ƿ�����Լ��
              k=FunSt(SolNew1);
    if k==1
			% ����Ŀ�꺯��ֵ�������ܣ�
			ENew = E_current(SolNew1);
			if ENew < ENow
				ENow = ENew;
			SolNow1 = SolNew1;
				if ENew < EBest
% ����ȴ��������õĽⱣ������
					EBest = ENew
                    disp(t);
					SolBest1 = SolNew1
                  
				end
			else
				% ���½��Ŀ�꺯��ֵС�ڵ�ǰ��ģ�
				% �����һ�����ʽ����½�
				if rand < exp(-(ENew-ENow)./t)
					ENow = ENew;
					SolNow1 = SolNew1;
				else	
					SolNew1 = SolNow1;
				end
			end
    end
		
        end
    t=t.*a;		% ���Ʋ���t���¶ȣ�����Ϊԭ����a��
      B=[B [EBest;t] ];
   end
  
	disp('���Ž�Ϊ��')
	disp(SolBest1)
	disp('��Сȼ�����ģ�')
	disp(EBest)
   
    
    
    