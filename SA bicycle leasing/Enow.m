%Ŀ�꺯��*****************
%ģ���˻�����ܺ���
function E=Enow(R1,R2,R3,Need,d)
t1=0;
t2=0;
t3=0;
l1size=size(R1,2);%·��һ��С
l2size=size(R2,2);%·�߶���С
l3size=size(R3,2);%·�߶���С
  if l1size>0
  %��L1��·ʱ��
  t1=(d(54,R1(1))+d(R1(l1size),54)).*60./30;%******************8
  for i=1:l1size-1
  t1=t1+d(R1(i),R1(i+1)).*60./30+abs(Need(R1(i)));
  end
  end
  if l2size>0
   %��L2��·ʱ��
  t2=(d(54,R2(1))+d(R2(l2size),54)).*60./30;
  for i=1:l2size-1
  t2=t2+d(R2(i),R2(i+1)).*60./30+abs(Need(R2(i)));
  end
  end
  if l3size>0
  %��L1��·ʱ��
  t3=(d(54,R3(1))+d(R3(l1size),54)).*60./30;%******************8
  for i=1:l1size-1
  t3=t3+d(R3(i),R3(i+1)).*60./30+abs(Need(R3(i)));
  end
  end
  
  E=max(max(t1,t2),t3);
  
end

