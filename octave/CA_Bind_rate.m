% Calculate Protein Concentrations using given formulas %
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
x=linspace(0,1,101)    

% x will be used for vars CAx, CAy              %
% calculate and plot concentraion of            %  
% proteins Prot2Cax & Prot1Cay based on the     %
% below equations                               %
%                                               %
% Note: x is actualy a vector - i.e we use      %
% scalar multiplication, division etc           %
% therefore the "dot" beside in every sign      %

% set CAx, CAy to x (we could use x directly)   %
CAx = x
CAy = x
% calculate protein concentrations Prot2Cax & Prot1Cay %
Prot2Cax = (CAx .* Prot2T) ./ ((CAx .+ K2) .* (1+(CAx ./ KI)));
Prot1Cay = (Prot1T .* CAy) ./ (K1 .+ CAy)

% plot the functions Prot2Cax(CAx) & Prot1Cay(CAy), CAx=CAy=x in [0,1]  %
plot(x, Prot2Cax, 'r', 'linewidth', 2, x, Prot1Cay, 'k', 'linewidth', 2)

xlabel('x')
ylabel('Prot2Cax & Prot1Cay')
% set grid on
grid on                                   
% additional display properties  for the figure
set(gca, 'fontsize', 16, 'linewidth', 1)  
title('Binding curves of the two proteins Prot2Cax & Prot1Cay')
%  set legends   %
lgnd{1} = sprintf("Protein: Prot2Cax\n")
lgnd{2} = sprintf("Protein: Prot1Cay\n")
legend (lgnd{1}, lgnd{2},"location", "northeast");                
set (legend, "fontsize", 12);
