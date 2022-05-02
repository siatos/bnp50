%clear all
clear all; 
clf;

%Initial values and params %
K1 = 5.88; 
K2 = 6.25*10^(-2);
KI = 2.2*10^(-2);
Prot2T = 10^(-2);
Prot1T = 10^(-2);

%100+1 values - we look in the closed [0,1] interval step is 0.01 %
t=linspace(0,1,101)    

% functions we need to calculate and plot %
% t is actulaly a vector - we use scalar multiplication, division there the "dot" beside in every sign %

Prot2Cax = (t .* Prot2T) ./((t .+ K2) .* (1+(t ./ KI)));
Prot1Cay = (Prot1T .* t) ./ (K1 .+ t)

% plot the functions
plot(t, Prot2Cax, 'r', 'linewidth', 2, t, Prot1Cay, 'k', 'linewidth', 2)

