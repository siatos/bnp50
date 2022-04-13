clear all; 
clf;

%% Function definition %%%
function res = membrane_potential(t, p)
   % p is 1x4 vector for the parameters of the equation
   E  = p(1)  % E = Nernst potential
   V0 = p(2)  % V0 = Potential at t = 0 
   G  = p(3)  % G = conductance of the membrane
   C  = p(4)  % C = capacitance    
   res =  E - (E - V0)*exp(-(G/C)*t) 
end;


% declare a cell of 1x5 strings to be used as legend initial value  %
% since we will have 5 different cases

lgnd = {"", "", "", "",""}


%%%%%%% Parameter vector  - 5 sets of params %%%%%%%%%%%%
%%                                                     %%
%%    First three cases = relationship between e, V0   %%
%%    The other two concentrate on the ratio g/C       %%  
%%                                                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

params = [-75 -50 0.02 0.04;  
           -75 -75 0.02 0.04;
           -75 -100 0.01 0.04;
           -75 -100 0.04 0.02;
           -75 -100 4.2 0.4]

% loop through the rows of params vector and calculate function values %
for i = 1:5 % we have 5 input parameter sets  
    for j = 1:2001 % time values from 0.0..1 with step 0.01 
        t(i,j) = (j-1)/100;
        funcg(i, j) =  membrane_potential (t(i,j), params(i,:));
    end
    % create also a legend for each graph
    lgnd{i} = sprintf("Ε= %2.1f V0= %2.1f G/C= %2.4f \n", params(i, 1), params(i, 2), params(i, 3)/params(i, 4))
end


% plot the graphs
plot(t(1,:), funcg(1,:),' r', 'linewidth', 2.5, 
     t(2,:), funcg(2,:),' k', 'linewidth', 2.5, 
     t(3,:), funcg(3,:),' c', 'linewidth', 2.5,
     t(4,:), funcg(4,:),' g', 'linewidth', 2.5,
     t(5,:), funcg(5,:),' y', 'linewidth', 2.5)
     


% display specifics %
xlabel('t')
ylabel('Membrane Potential (mV)')

% set grid on
grid on                                   

% additional display properties
set(gca, 'fontsize', 20, 'linewidth', 1)  
title('Μεμβρανικά Δυναμικά Different parameters')

% add a legend
legend (lgnd{1}, lgnd{2}, lgnd{3}, lgnd{4}, lgnd{5},"location", "northeast");                
set (legend, "fontsize", 12);
