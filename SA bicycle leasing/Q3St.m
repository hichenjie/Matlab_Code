
%Լ������**********************************************
 function K=Q3St(R1,R2,R3,Need)
 
  m=53;%mΪ���е����޵���
  l1size=size(R1,2);%·��һ��С
  l2size=size(R2,2);%·��һ��С
  l3size=size(R3,2);%·��һ��С
  
  N1=zeros(1,l1size);
  N2=zeros(1,l2size);
  N3=zeros(1,l3size);
  
  K=1;
 
  %Լ������һ:ÿ��·�������ܺ���0
   if (l1size+l2size+l3size>m)||(l1size+l2size+l3size<m)
        K=0;
    end
if l1size>0
    for p=1:l1size
        N1(p)=Need(R1(p));
    end
end
if l2size>0
    for p=1:l2size
       N2(p)=Need(R2(p));
    end
end
if l3size>0
    for p=1:l3size
       N3(p)=Need(R3(p));
    end
end
    %if (sum(N1)>0)||(sum(N2)<0)||(sum(N1)>0)||(sum(N2)<0)||(sum(N3)>0)||(sum(N3)<0) 
    %    K=0;
    %end
    
    
   % if abs(sum(N1))>40||abs(sum(N2))>40||sum(abs(N3)>40)
    %    K=0;
    %end
    
  if K==1  %��������һ�ͼ�����
   %Լ����������ÿ��������ĳ�������������
        Car1=0;Car2=0;Car3=0;
            for p=1:l1size
              Car1=Car1+Need(R1(p));
                    if Car1<-60
                         K=0 ;
                      break
              end
            end
         for p=1:l2size
               Car2=Car2+Need(R2(p));
               if Car2<-60
                   K=0 ;
                  break
               end
          end   
	   for p=1:l3size
              Car3=Car3+Need(R3(p));
                    if Car3<-60
                         K=0 ;
                      break
              end
         end
  end            
            
end