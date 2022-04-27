% Lotka-Voltera prey-predator model %

%Initial values and params
y01(1) = 20  % Initial predator population
y01(2) = 80  % Initial prey population
 
% Time intervals
% Tinterval = linspace(0, 50, 1001)   % time step of 0.05 in total 1001 values
% but instead of using Tinterval we split in two halves: Tinterval=Tinterval1+Tinterval2 
Tinterval1 = linspace(0, 24.95, 500)   % time step of 0.05 in total 500 values
Tinterval2 = linspace(25, 50, 501)     % time step of 0.05 in total 501 values

% we have two set of params declared as a vector of two rows
% first row will be used for t < 25
% second row will be used for 25 <= t < 50
params1 = [40 2 0.5 70];
params2 = [20 1 0.25 35]

% define a function that contains the system of LV odes
function res = LV(t,V, params)
    % Dependent variables V - vector of v1 & v2
    % v1 is the predator population at time t
    % v2 is the prey population at time t 
    v1 = V(1);
    v2 = V(2);
    % pass params to α(=a), β(=b), γ(=c), δ(=d)
    a = params(1);
    b = params(2);
    c = params(3); 
    d = params(4);
    dxdt = (-d)*v1+c*v1*v2;   % rate of predator population X
    dydt = a*v2 - b*v1*v2     % rate of prey population Y
    % Pack-up result
    res = [dxdt; dydt];
end


%  
% use anonymous function and get the handle
rate1 = @(t,V) LV(t,V, params1);
rate2 = @(t,V) LV(t,V, params2);
   
% solve odes by using ode45 and anonymous function handle
% y01 is the initial value vector
% return a vector of type (t, v) where v = v(1), v(2) at any time t
[T1,V1] = ode45(rate1, Tinterval1, y01);
[T2,V2] = ode45(rate2, Tinterval2, y01); 

figure(1)   % First figure for the populations %
lgnd1 = sprintf("%s%s", "X(t):", "Θηρευτής t < 25")
lgnd2 = sprintf("%s%s", "Y(t):", "Θήραμα t < 25")
lgnd3 = sprintf("%s%s", "X(t):", "Θηρευτής 25<= t <50")
lgnd4 = sprintf("%s%s", "Y(t):", "Θήραμα 25<= t <50")

h = plot(T1, V1(:,1), 'r', 'linewidth', 1, 'DisplayName', lgnd1, 
         T1, V1(:,2), 'k', 'linewidth', 1, 'DisplayName', lgnd2,
         T2, V2(:,1), 'g', 'linewidth', 1, 'DisplayName', lgnd3,
         T2, V2(:,2), 'c', 'linewidth', 1, 'DisplayName', lgnd4)   
legend;
% display specifics %
xlabel('Time t')
ylabel('X(t): Θηρευτής - Y(t): Θήραμα')
% set grid on
grid on                                   
% additional display properties  for the first figure 
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Lotka-Voltera Prey-Predator model')

figure(2) % Second figure for the sum of populations %
lgnd1 = sprintf("%s%s", "X(t)+Y(t):", "Θηρευτής+Θήραμα t < 25")
lgnd2 = sprintf("%s%s", "X(t)+Υ(t):", "Θηρευτής+Θήραμα 25 < t")

h = plot(T1, V1(:,1)+V1(:,2), 'r', 'linewidth', 1, 'DisplayName', lgnd1, 
         T2, V2(:,1)+V2(:,2), 'c', 'linewidth', 1, 'DisplayName', lgnd2)   
legend;
% display specifics %
xlabel('Time t')
ylabel('N(t)= X(t)+Y(t)')
% set grid on
grid on                                   
% additional display properties  for the second figure 
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Lotka-Voltera Prey-Predator model - Sum of Populations')

figure(3) % Third figure for the phase portrait t < 25 %
% Phase portait is a plot of X(t)-Θηρευτής vs Y(t)-Θήραμα
h = plot(V1(:,1), V1(:,2), 'k', 'linewidth', 1)   
% display specifics %
xlabel('X(t): Θηρευτής t < 25')
ylabel('Y(t): Θήραμα t < 25')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Portrait for Lotka-Voltera Model 1st case t < 25')

figure(4) % Forth figure for the phase portrait 25 <= t < 50  %
% Phase portait is a plot of X(t)-Θηρευτής vs Y(t)-Θήραμα
h = plot(V2(:,1), V2(:,2), 'k', 'linewidth', 1)   
% display specifics %
xlabel('X(t): Θηρευτής 25 <= t')
ylabel('Y(t): Θήραμα 25 <= t')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Portrait for Lotka-Voltera Model 2nd case t >= 25')

