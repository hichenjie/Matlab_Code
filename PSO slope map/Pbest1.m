% 用回旋搜索最佳粗避障方向2400m的目标函数
function Q=Pbest1(x,y,z) 
    gaodu=z;
    m=1;
    Podu=zeros(1,404010);
    ave=0;
    while (ave<30&&(y-m)>1&&(x-m)>1&&(x+m)<2299&&(y+m)<2299)
      nm=1;
         for i=-m:m
                for j=-m:m
                    a=x+i-1;b=x+i;c=x+i+1;
                    d=y+j-1;e=y+j;f=y+j+1;
                    dzx=((gaodu(a,d)+2.*gaodu(a,e)+gaodu(a,f))-(gaodu(c,d)+2.*gaodu(c,e)+gaodu(c,f)))./8;
                    dzy=((gaodu(a,d)+2.*gaodu(b,d)+gaodu(c,d))-(gaodu(a,f)+2.*gaodu(b,f)+gaodu(c,f)))./8;
                    Podu(nm)=atan((dzx.^2+dzy.^2).^0.5).*180./pi;
                    nm=nm+1;
                end
         end
     m=m+1;
ave=max(max(Podu));
    end
    
    Q=-m;
end


   