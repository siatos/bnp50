% %Initial values and params
V0(1) = 1; %initial value for n1
V0(2) = 0; %initial value for n2
V0(3) = -1; %initial value for a

% Time interval
Tinterval = linspace(0, 2, 201)   % time step of 0.01 in total 201 values %

% solve odes by using ode45 and anonymous function handle
[t,V] = ode45(@vtg_ode, Tinterval, V0);
hold on
plot(t, V(:,1),"Color", 'r', 'LineWidth', 1)
plot(t, V(:,2),"Color", 'k', 'LineWidth', 2)
lgnd1 = sprintf("%s", "n1(t)")
lgnd2 = sprintf("%s", "n2(t)")
legend({lgnd1, lgnd2});
% display specifics %
xlabel('Time t')
ylabel('n1(t) - n2(t)')
% set grid on
grid on                                   
% additional display properties  for the figure
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Vascular Tumor Growth')
hold off

