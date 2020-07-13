function [dx]=MA1(t,x,u)
R0=0.5;
R1=1;
R2=1;
L1=0.001;
L2=0.001;
C1=0.001;
C2=0.001;

meinpath = pwd;
datapath = fullfile(meinpath,'diode1n4148.txt');
[p,xaxis]=functionfor1D(datapath);
xaxis_neu=sort(xaxis);

if x(3) < xaxis_neu(1)%V(Diode) kleiner als 1.St¨¹tzstellen
    I_d1 = polyval(p(1,:),x(3));% verwenden 1.Polynom aus die St¨¹ckweise Polynome
elseif x(3)>xaxis_neu(1) && x(3)<xaxis_neu(2)
    I_d1 = polyval(p(2,:),x(3));
elseif x(3)>xaxis_neu(2) && x(3)<xaxis_neu(3)
    I_d1 = polyval(p(3,:),x(3));
elseif x(3)>xaxis_neu(3) && x(3)<xaxis_neu(4)
    I_d1 = polyval(p(4,:),x(3));
elseif x(3)>xaxis_neu(4) && x(3)<xaxis_neu(5)
    I_d1 = polyval(p(5,:),x(3));
end

if x(4) < xaxis_neu(1)
    I_d2 = polyval(p(1,:),x(4));
elseif x(4)>xaxis_neu(1) && x(4)<xaxis_neu(2)
    I_d2 = polyval(p(2,:),x(4));
elseif x(4)>xaxis_neu(2) && x(4)<xaxis_neu(3)
    I_d2 = polyval(p(3,:),x(4));
elseif x(4)>xaxis_neu(3) && x(4)<xaxis_neu(4)
    I_d2 = polyval(p(4,:),x(4));
elseif x(4)>xaxis_neu(4) && x(4)<xaxis_neu(5)
    I_d2 = polyval(p(5,:),x(4));
end

dx(1,1)= -((R0+R1)/L1)*x(1)-1/(L1)*x(3)+1/(L1)*u(1);
dx(2,1)= -(R2/(L2))*x(2)+1/(L2)*x(3)-1/(L2)*x(4);
dx(3,1)= 1/(C1)*x(1)-1/(C1)*x(2)-1/(C1)*I_d1;
dx(4,1)= 1/(C2)*x(2)-1/(C2)*I_d2;
