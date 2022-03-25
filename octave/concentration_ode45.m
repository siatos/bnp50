%Initial values and params
S0 = [0, 0];           % initial values of s1 & s2
Tinterval = 0:0.01:2   % time step of 0.01 in total 201 values
params = [20 5 5 5 2 1 4; 30 6 6 6 3 2 5; 10 2 2 2 2 1 2]

% since we use a set of params having 3 members (above params matrix is a 3x7 marix)
% we will have  3x2 = 6 graphs in the same graph plot
% each couple (s1, s2) of plots (depends on a row from the params matrix)
% will have same color for both members of the couple s1 & s2 
% but different linewidth to be distinguishable
% first row of params will be green
% second row will be black
% third row will be blue

colors = ['g'; 'k'; 'b'] 

% declare a cell of 1x3 strings to be used as legend initial value  %
lgnd = {"", "", ""}

function res = rate(t,S, k1, k2, k3, k4, k5, K, n)

    % Dependent variables S - vector of s1 & s2 
    s1 = S(1);
    s2 = S(2);
    dsdt1 = k1/(1+power((s2/K), n))-k3*s1-k5*s1;
    dsdt2 = k2 + k5*s1-k4*s2
    % Pack-up result
    res = [dsdt1; dsdt2];
end

%
hold on

% loop for the 3 test case param sets 
for i=1:3
   k1 = params(i, 1);
   k2 = params(i, 2);
   k3 = params(i, 3); 
   k4 = params(i, 4); 
   k5 = params(i, 5); 
   K  = params(i, 6);
   n  = params(i, 7);
   % use anonymous function and get the handle
   rate2 = @(t,S) rate(t,S, k1, k2, k3, k4, k5, K, n);
   
   %solve odes by using ode45 (runge-kutta) and anonymous function handle
   [T,S] = ode45(rate2, Tinterval, S0);
 
   % get the two different s1 and s2 concentrations 
   Y(i,:) = S(:,1);  % s1
   Z(i,:) = S(:,2);  % s2 

end

% display specifics %
xlabel('Time t')
ylabel('S1(t) & S2(t)')

% set grid on
grid on                                   

% additional display properties  for the first figure concentrations S1(t) & S2(t)
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Concentration Rates of S1 and S2 species')

for i=1:3
   % draw specifics to distinguish the plots - we will have six plots within the same graph plot
   % draw s1 "thin" s2 "fat" use same color for both graphs
   lstr = sprintf("k1=%d k2=%d k3=%d k4=%d k5=%d K=%d n=%d", params(i,1), params(i,2), params(i,3), params(i,4), params(i,5), params(i, 6), params(i, 7))
   lgnd1 = sprintf("%s%s", "s1(t):", lstr)
   lgnd2 = sprintf("%s%s", "s2(t):", lstr)   
   h = plot(T, Y(i,:), colors(i), 'linewidth', 1.5, 'DisplayName', lgnd1, T, Z(i,:), colors(i), 'linewidth', 3, 'DisplayName', lgnd2)   
   legend;
end  


%release hold of plot engine we finished with first figure
hold off 
figure    % need a second figure for the phase diagrams 

hold on  % get the hold

% display specifics %
xlabel('S1')
ylabel('S2')

% set grid on
grid on                                   

% additional display properties  for the first figure concentrations S1(t) & S2(t)
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Diagram Plots of S1 and S2')

% declare a cell of 1x3 strings to be used as legend initial value  %
lgnd = {"", "", ""}

for i=1:3
   % each phase diagram is a plot of s1 vs s2
   % there will be three plots within the same figure
   %recreate the legend  
   lgnd{i} = sprintf("k1=%d k2=%d k3=%d k4=%d k5=%d K=%d n=%d", params(i,1), params(i,2), params(i,3), params(i,4), params(i,5), params(i, 6), params(i, 7))
   h = plot(Y(i,:), Z(i,:), colors(i), 'linewidth', 1.5)   
end  
legend (lgnd{1}, lgnd{2}, lgnd{3}, "location", "northeast");                
set (legend, "fontsize", 12); 
hold off
