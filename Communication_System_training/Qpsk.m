clear all
    close all
Nf=1000;%符号个数
Nc=100;%采样个数
ts=1/Nc;
fc=3;
N=Nf*Nc;
t=0:1/Nc:Nf-1/Nc;
Nfft=2^16;
s1=2*randint(1,Nf)-1;
s2=2*randint(1,Nf)-1;
singal1=rectpulse(s1,Nc);
singal2=rectpulse(s2,Nc);
Spsk=singal1.*cos(2*pi*fc*t)-singal2.*sin(2*pi*fc*t);
window=boxcar(length(Spsk));
[pxx,f]=periodogram(Spsk,window,Nfft,Nc);
Num=10^5;
d1=sign(randn(1,Num));
d2=sign(randn(1,Num));
d=d1+j*d2;
ENdb=-2:1:10;
EN=10.^(ENdb./20);
no=1./EN;
B=zeros(size(no));

for n=1:length(no)
    r=d+no(n).*randn(1,Num);
    d_Spsk2=sign(r);
    B(n)=length(find(d_Spsk2~=Spsk));
end
b=berawgn(ENdb,'qam',4);

semilogy(ENdb,b,'r-o','linewidth',2)
title('Qpsk性能曲线')
xlabel('Eb/N0');
ylabel('误码率');
grid on


