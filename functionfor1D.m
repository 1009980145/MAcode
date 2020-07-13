function [coefs,xaxis] = functionfor1D(pathofthefilename)
filename=pathofthefilename;%'.\diode1n4148.txt';
%filename='.\diode1n4148.txt';

[a,b,c]=textread(filename,'%f%f%f','headerlines',1);%a:V1 b:V(Diode) c:I(Diode)

%Maximal,Minimal Punkt
cmax=max(c);
cmax_index=find(cmax==c);%index f¨¹r Max
cmin=min(c);
cmin_index=find(cmin==c);%index f¨¹r Min
%Wendepunkt
c_diff=diff(c);
c_diff_max=max(abs(c_diff));
wendpunkt=find(c_diff_max==c_diff);%index f¨¹r Wendepunkt
%St¨¹tzstellen:(1/4,2/4,3/4) von V(Diode)
long=length(c);
zahl1=fix(long/4);
zahl2=fix(long/2);
zahl3=fix(3*long/4);

%alle St¨¹tzstellen
xaxis=[b(cmax_index),b(cmin_index),b(wendpunkt),b(zahl1),b(zahl2),b(zahl3)];
yaxis=[c(cmax_index),c(cmin_index),c(wendpunkt),c(zahl1),c(zahl2),c(zahl3)];


pp=spline(xaxis,yaxis);%struktur f¨¹r st¨¹cktweise polynom
yy=spline(xaxis,yaxis,b);%Entsprechend Werte f¨¹r V(Diode) 
[breaks,coefs,L,order,dim]=unmkpp(pp);%coefs:die Koeffizient f¨¹r die Polynome

f1=figure;
subplot(1,2,1);
plot(b,c);
subplot(1,2,2);
plot(xaxis,yaxis,'o',b,yy);

%test von den st¨¹ckweise Polynom
f2=figure;
xq = 0:0.01:1;
plot(xq,ppval(pp,xq))

