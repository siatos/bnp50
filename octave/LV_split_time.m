% Lotka-Voltera prey-predator model %

%Initial values and params
y01(1) = 20  % Initial predator population
y01(2) = 80  % Initial paey population
 
%y0 = [20, 80];          % initial values of x & y
%Tinterval = 0:0.05:50   % time step of 0.01 in total 201 values

% Time interval
Tinterval = linspace(0, 50, 1001)   % time step of 0.05 in total 1001 values
% instead of using Tinterval we split in two halves: Tinterval=Tinterval1+Tinterval2 
Tinterval1 = linspace(0, 24.95, 500)   % time step of 0.05 in total 500 values
Tinterval2 = linspace(25, 50, 501)   % time step of 0.05 in total 501 values

% we have two set of params declared as a vector of two rows
% first row will be used for t < 25
% second row will be used for 25 <= t < 50
%params = [40 2 0.5 70; 20 1 0.25 35]
params1 = [40 2 0.5 70];
params2 = [20 1 0.25 35]


colors = ['k', 'r']  % predator (X) color black, prey (Y) color red 
colors1 = ['k', 'r']  % predator (X) color black, prey (Y) color red 
colors2 = ['c', 'g']  % predator (X) color black, prey (Y) color red 


% define a function that contains the system of LV odes
function res = LV(t,V, params)
    % Dependent variables V - vector of v1 & v2
    % v1 is the predator population at time t
    % v2 is the prey population at time t 
    v1 = V(1);
    v2 = V(2);
    % selection of param set depends on time
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


figure(1)
lgnd1 = sprintf("%s%s", "X(t):", "Θηρευτής t < 25")
lgnd2 = sprintf("%s%s", "Y(t):", "Θήραμα t < 25")
lgnd3 = sprintf("%s%s", "X(t):", "Θηρευτής 25<= t <50")
lgnd4 = sprintf("%s%s", "Y(t):", "Θήραμα 25<= t <50")

h = plot(T1, V1(:,1), 'r', 'linewidth', 1.5, 'DisplayName', lgnd1, 
         T1, V1(:,2), 'k', 'linewidth',  2, 'DisplayName', lgnd2,
         T2, V2(:,1), 'g', 'linewidth', 1, 'DisplayName', lgnd3,
         T2, V2(:,2), 'c', 'linewidth', 1, 'DisplayName', lgnd4)   
legend;
% display specifics %
xlabel('Time t')
ylabel('X(t): Θηρευτής - Y(t): Θήραμα')
% set grid on
grid on                                   
% additional display properties  for the first figure concentrations S1(t) & S2(t)
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Lotka-Voltera Prey-Predator model')



figure(2) % need a second figure for the phase diagrams 
% Phase portait is a plot of X(t)-Θηρευτής vs Y(t)-Θήραμα
h = plot(V1(:,1), V1(:,2), 'k', 'linewidth', 1)   
% display specifics %
xlabel('X(t): Θηρευτής t < 25')
ylabel('Y(t): Θήραμα t < 25')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Portrait for Lotka-Voltera Model')

figure(3) % need a third figure for the phase diagrams 
% Phase portait is a plot of X(t)-Θηρευτής vs Y(t)-Θήραμα
h = plot(V2(:,1), V2(:,2), 'k', 'linewidth', 1)   
% display specifics %
xlabel('X(t): Θηρευτής 25 < t')
ylabel('Y(t): Θήραμα 25 < t')
% set grid on
grid on                                   
% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Portrait for Lotka-Voltera Model')



