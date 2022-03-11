V0=1
x=linspace(0, 10, 100)
% first case a=b=1.2%
a=b=1.2
y1=V0*exp(a*(1-exp(-b*x))/b)

% second case a=b=2.2 %
a=b=2.2
y2=V0*exp(a*(1-exp(-b*x))/b)

% third case a=b=3.4 %
a=b=3.4
y3=V0*exp(a*(1-exp(-b*x))/b)

% forth case a=1.0 b=2 %
a=1.0
b=2
y4=V0*exp(a*(1-exp(-b*x))/b)

plot(x, y1,' r', 'linewidth', 1, x, y2, ' b', 'linewidth', 2, x, y3, ' k', 'linewidth', 2, x, y4, ' c')
grid on
set(gca, 'fontsize', 24, 'linewidth', 1)
title('Gompertz function')
xlabel('X')
ylabel('Y')
h ={"a=b=1.2", "a=b=2.2", "a=b=3.4", "a=1 b=2"};
legend (h, "location", "northeast");
set (legend, "fontsize", 12);
