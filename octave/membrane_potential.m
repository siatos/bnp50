clear all; 
clf;

% Time interval
%Tinterval = linspace(0, 10, 1001)   
%  

function res = membrane_potential(t, p)
   % p is 1x4 vector for the parameters of the equation
   E  = p(1)  % E = Nernst potential
   V0 = p(2)  % V0 = Potential at t = 0 
   G  = p(3)  % G = conductance of the membrane
   C  = p(4)  % C = capacitance 
   
   res =  E - (E - V0)*exp(-(G/C)*t) 
end;


% declare a cell of 1x3 strings to be used as legend initial value  %
lgnd = {"", "", ""}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST CASE - ALL PARAMS SAME  EXCEPT V0 POTENTIAL: THREE CASES % 
% V0 < E                                                         %
% V0 = E                                                         % 
% V0 > E                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Toggle - set the "hold" state of the plotting engine
%hold on
figure(1)  % 1st case all parameters same except V0

%%%  Parameter vector  - 3 sets of params        %%
params1 = [-75 -100 0.02 0.0022; -75 -50 0.04 0.0022;  -75 -75 0.01 0.0010]


% loop through the rows of params vector and calculate function values %
for i = 1:3 % we have 3 input vectors  
    for j = 1:101 % time values from 0.0..1 with step 0.01 
        t(i,j) = (j-1)/100;
        funcg (i, j) =  membrane_potential (t(i,j), params1(i,:));
    end
    % create also a legend for each graph
    lgnd{i} = sprintf("Ε= %2.1f V0= %2.1f\n", params1(i, 1), params1(i, 2))
end

% plot the graphs
plot(t(1,:), funcg(1,:),' r', 'linewidth', 2, t(2,:), funcg(2,:),' k', 'linewidth', 2, t(3,:), funcg(3,:),' c', 'linewidth', 2)
% display specifics %
xlabel('t')
ylabel('Membrane Potential (mV)')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 20, 'linewidth', 1)  
title('Μεμβρανικά Δυναμικά - Case 1 - Different V0 potential')

% add a legend
legend (lgnd{1}, lgnd{2}, lgnd{3}, "location", "northeast");                
set (legend, "fontsize", 12);
% release hold
%hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND CASE - DIFFERENT PARAMS                                 % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Toggle - set the "hold" state of the plotting engine
%hold on
figure(2)

%%%  Parameter vector  - 3 sets of params        %%
params2 = [-75 -100 0.02 0.0022; -75 -100 0.04 0.0022;  -75 -100 0.04 0.022]

% loop through the rows of params vector and calculate function values %
for i = 1:3 % we have 3 input vectors  
    for j = 1:301 % time values from 0.0..3 with step 0.01 
        t(i,j) = (j-1)/100;
        funcg (i, j) =  membrane_potential (t(i,j), params2(i,:));
    end
    % create also a legend for each graph
    lgnd{i} = sprintf("Ε= %2.1f V0= %2.1f G/C= %2.4f \n", params2(i, 1), params2(i, 2), params2(i, 3)/params2(i, 4))
end

% plot the graphs
plot(t(1,:), funcg(1,:),' r', 'linewidth', 2, t(2,:), funcg(2,:),' k', 'linewidth', 2, t(3,:), funcg(3,:),' c', 'linewidth', 2)
% display specifics %
xlabel('t')
ylabel('Membrane Potential (mV)')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 20, 'linewidth', 1)  
title('Μεμβρανικά Δυναμικά - Case 2 - Different params')
% add a legend
legend (lgnd{1}, lgnd{2}, lgnd{3}, "location", "northeast");                
set (legend, "fontsize", 12);
% release hold
%hold off


