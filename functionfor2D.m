%function functionfor2D(pathofthefile)

% geben die Werten f��r U_GS,U_DS und I(U_DS) 
% filename=pathofthefilename;%'.\diode1n4148.txt';
% 
% [a,b,c,d]=textread(filename,'%f%f%f%f','headerlines',2);
% long=length(b);
% zahl1=


X = [-0.5 -0.5 0.5 0.5 0.5 0.5;
    -0.1 -0.1 0.1 0.1 0.1 0.1;
    0.3 0.3 0.3 0.3 0.3 0.3;
    0.7 0.7 0.7 0.7 0.7 0.7;
    1.1 1.1 1.1 1.1 1.1 1.1;
    1.5 1.5 1.5 1.5 1.5 1.5];
Y = [-0.5 -0.1 0.3 0.7 1.1 1.5;
    -0.5 -0.1 0.3 0.7 1.1 1.5;
    -0.5 -0.1 0.3 0.7 1.1 1.5;
    -0.5 -0.1 0.3 0.7 1.1 1.5;
    -0.5 -0.1 0.3 0.7 1.1 1.5;
    -0.5 -0.1 0.3 0.7 1.1 1.5];

 Z = [-2.4e-6 -4.8e-6 -8e-6 -1.2e-5 -1.6e-5 -2e-5;
     -6.6e-13 -6.7e-13 -7e-7 -1.5e-6 2.3e-6 -3.1e-6;
     6.1e-13 6.1e-13 9e-7 3.3e-6 5.7e-6 8.1e-6;
     1.4e-12 1.4e-12 9e-7 4.9e-6 1.1e-5 1.6e-5;
     2.2e-12 2.2e-12 9e-7 4.9e-6 1.2e-5 2.1e-5;
     3e-12 3e-12 9e-7 4.9e-6 1.2e-5 2.3e-5];

[M, N] = size(X);

Polt_stutzstellen(M, N, X, Y, Z);%zeigen alle St��tzstellen

Polt_Bspline(M, N, X, Y, Z);