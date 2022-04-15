% Lotka-Voltera prey-predator model %

%Initial values and params
y01(1) = 20  % Initial predator population
y01(2) = 80  % Initial prey population
 
% Time interval
Tinterval = linspace(0, 50, 1001)   % time step of 0.05 in total 1001 values

% we have two set of params declared as a vector of two rows
% first row will be used for t < 25
% second row will be used for 25 <= t < 50
params = [40 2 0.5 70; 20 1 0.25 35]

colors = ['k', 'r']  % predator (X) color black, prey (Y) color red 

%%%%%%%%% Solve system of odes  %%%%%%%%%%%%%%%%%%%%%%%
% define a function that contains the system of LV odes
function res = LV(t,V, params)
  
    % Dependent variables V - vector of v1 & v2
    % v1 is the predator population at time t
    % v2 is the prey popul;ation at time t 
    v1 = V(1);
    v2 = V(2);
    % selection of param set depends on time
    if (t < 25)  % use first row of params 
      a = params(1, 1);
      b = params(1, 2);
      c = params(1, 3); 
      d = params(1, 4);
     else        % use second row of params
      a = params(2, 1);
      b = params(2, 2);
      c = params(2, 3); 
      d = params(2, 4);
     endif 
    dxdt = (-d)*v1+c*v1*v2;   % rate of predator population X
    dydt = a*v2 - b*v1*v2     % rate of prey population Y
    % Pack-up result
    res = [dxdt; dydt];
end

% use anonymous function and get the handle
rate2 = @(t,V) LV(t,V, params);
   
% solve odes by using ode45 and anonymous function handle
% y01 is the initial value vector
% return a vector of type (t, v) where v = v(1), v(2) at any time t
[T,V] = ode45(rate2, Tinterval, y01); 

%%%%%%%% First figure %%%%%%%%%%%%%%%
% Both poulations  X(t), Y(t) will be displayed
figure(1)     
lgnd1 = sprintf("%s%s", "Χ(t):", "Πληθυσμός Θηρευτή")
lgnd2 = sprintf("%s%s", "Υ(t):", "Πληθυσμός Θηράματος ")
h1 = plot(T, V(:,1), 'r', 'linewidth', 1.5, 'DisplayName', lgnd1, 
         T, V(:,2), 'k', 'linewidth',  2, 'DisplayName', lgnd2)
legend({lgnd1, lgnd2});
% display specifics %
xlabel('Time t')
ylabel('X(t): Θηρευτής - Y(t): Θήραμα')
% set grid on
grid on                                   
% additional display properties  for the figure
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Lotka-Voltera Prey-Predator model, X & Y populations')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Second figure %%%%%%%%%%%%%%%
% Only sum of X(t)+Y(t) will be displayed
figure(2)
lgnd3 = sprintf("%s", "N(t): Άθροισμα Πληθυσμών X+Y")   
h2 = plot(T, V(:,1)+ V(:,2), 'g', 'linewidth', 1, 'DisplayName', lgnd3)   
legend({lgnd3});
% display specifics %
xlabel('Time t')
ylabel('N(t) = Θηρευτής+Θήραμα (X(t)+Y(t))')
% set grid on
grid on                                   
% additional display properties  for the figure 
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Lotka-Voltera Prey-Predator model - Sum of populations')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Third figure %%%%%%%%%%%%%%%
%%%%%%%%%%  Phase Portrait %%%%%%%%%%%%%
figure(3)    % need a third figure for the phase diagrams 
% Phase portait is a plot of X(t)-Θηρευτής vs Y(t)-Θήραμα
h = plot(V(:,1), V(:,2), 'k', 'linewidth', 1)   
% display specifics %
xlabel('Χ(t): Πληθυσμός Θηρευτή')
ylabel('Χ(t): Πληθυσμός Θηράματος')
% set grid on
grid on                                   
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Phase Portrait for Lotka-Voltera Model')


