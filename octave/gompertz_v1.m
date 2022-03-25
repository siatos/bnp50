v0=1                     % initial value
%t=linspace(0, 4, 100)  % define a t var in linspace with range 0..10 step 0.1 
t = 0:0.1:200            % define a t vector - with range 0..10 step 0.1 

% first case %
a=1
b=0.055
c=a/b
lgnd1 = sprintf("a = %1.3f b = %1.3f c = %2.3f", a, b, c)

printf("First case: %s\n\n", lgnd1)
v1=v0*exp(c*(1-exp(-b*t)))

% second case a=4.6 b=1.8 %
a=0.5
b=0.03
c=a/b
lgnd2 = sprintf("a = %1.3f b = %1.3f c = %2.3f", a, b, c)
printf("Second case: %s\n\n", lgnd2)
v2=v0*exp(c*(1-exp(-b*t)))

% third case a=9 b=5 %
%a=1
%b=0.08
%c=a/b
%lgnd3 = sprintf("a = %1.3f b = %1.3f c = %2.3f", a, b, c)
%printf("Third case: %s\n\n", lgnd3)
%v3=v0*exp(c*(1-exp(-b*t)))

% forth case a=3.6 b=2 %
%a=0.5
%b=0.06
%c=a/b
%lgnd4 = sprintf("a = %1.3f b = %1.3f c = %2.3f", a, b, c)
%printf("Forth case: %s\n\n", lgnd4)
%v4=v0*exp(c*exp(1-exp(-b*t)))


% define display characteristics for the graphs
% line thickness is 2
% first will displayed red, second blue third yellow forth black 
plot(t, v1,' r', 'linewidth', 2, t, v2, ' b', 'linewidth', 2) 


% set grid on
grid on                                   

% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Gompertz function')
xlabel('t')                    % x-axis legend
ylabel('V(t)')                 % y-axis legend 

lgnd ={lgnd1, lgnd2};   % prepare the legend string
% specify where legend will be displayed
legend (lgnd, "location", "northeast");                
set (legend, "fontsize", 12);
