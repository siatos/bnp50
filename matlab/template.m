%  %

%Initial values and params
y01(1)  = 20  %
y01(2)  = 80  %
y01(3)  = 10  %

% Time interval
Tinterval = linspace(0, 40, 1001)   % time step of 0.04 in total 1001 values %

% Different colors  %
%colors = ['k', 'r', 'y']  % color black,  color red

% use anonymous function and get the handle
rate = @(t,V)template_odes(t,V);

% solve odes by using ode45 and anonymous function handle
% y01 is the initial value vector
% return a vector of type (t, v) where v = v(1), v(2), v(3) at any time t
[T,V] = ode45(rate, Tinterval, y01);

%%%%%%%% First figure %%%%%%%%%%%%%%%
% Both poulations  X(t), Y(t), Z(t) will be displayed
figure(1)
hold on
plot(T, V(:,1),"Color", 'r', 'LineWidth', 1);
plot(T, V(:,2),"Color", 'k', 'LineWidth', 1);
plot(T, V(:,3),"Color", 'g', 'LineWidth', 1);

lgnd1 = sprintf("%s%s", "Χ(t):", "Πληθυσμός Θηράματος");
lgnd2 = sprintf("%s%s", "Υ(t):", "Πληθυσμός Θηρευτή 1 ");
lgnd3 = sprintf("%s%s", "Υ(t):", "Πληθυσμός Θηρευτή 2 ");

legend({lgnd1, lgnd2, lgnd3});
% display specifics %
xlabel('Time t');
ylabel('X(t): Θήραμα - Y(t): Θηρευτής 1 - Ζ(t): Θηρευτής 2');
% set grid on
grid on;
% additional display properties  for the figure
set(gca, 'fontsize', 24, 'linewidth', 1);
title('Lotka-Voltera Prey-Predator model, X & Y & Ζ populations');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Second figure %%%%%%%%%%%%%%%
% Only sum of X(t)+Y(t)+Ζ(τ) will be displayed
figure(2)
lgnd4 = sprintf("%s", "N(t): Άθροισμα Πληθυσμών X+Y")
h2 = plot(T, V(:,1)+ V(:,2) + V(:, 3), 'g', 'linewidth', 1, 'DisplayName', lgnd3)
legend({lgnd4});
% display specifics %
xlabel('Time t')
ylabel('N(t) = Θηρευτής 1&2+Θήραμα (X(t)+Y(t)+Z(t)')
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
h = plot(V(:,2), V(:,3), 'k', 'linewidth', 1)
% display specifics %
xlabel('Υ(t): Πληθυσμός Θηρευτή 1')
ylabel('Ζ(t): Πληθυσμός Θηρευτή 2')
% set grid on
grid on
set(gca, 'fontsize', 24, 'linewidth', 1)
title('Phase Portrait for Lotka-Voltera Model')


