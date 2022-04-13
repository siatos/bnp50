%Initial values and params
clear all; clf;

function [Prot2Cax, Prot1Cay] = rate(K1, K2, KI, Prot2T, Prot1T, x)
    CAx = x;
    CAy = x; 
    Prot2Cax = (Prot2T*CAx)/((K2+CAx)*(1+(CAx/KI)));
    Prot1Cay = (Prot1T*CAy)/(K1+CAy)
endfunction
clear;

%
K1 = 5.88; 
K2 = 6.25*10^(-2);
KI = 2.2*10^(-2);
Prot2T = 10^(-2);
Prot1T = 10^(-2);

T=linspace(0,1,101)  %  
CARate=zeros(101,2)    % 1001x2 matrix

for t = 1:101  % 
   tslice = (t-1)/100; %time from 0.0..1.0 step 0.01
   [CARate(t, 1), CARate(t,2)] = rate(K1, K2, KI, Prot2T, Prot1T, tslice);
end
plot(T, CARate(:, 1), 'r', 'linewidth', 2, T, CARate(:, 2), 'k', 'linewidth', 2)
%Y=result(:,2)
%Z=result(:,1)
%plot(Y, tslice)


