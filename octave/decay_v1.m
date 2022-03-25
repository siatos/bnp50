clear all; clf;

% function to calculate a(t) = 100/exp(kt) %
function f_calc = expat(m, t)
  % input m: a vector i.e. 2-tuple  of a0, k      %
  % input t:  represents time t steps             %
  a0 = m(1)          %  a0=a(0)=100 given 
  k  = m(2)          %  m(2) is k in the original equation 
	f_calc =  a0/exp(k*t) 
end;

clear;

% declare a 3x2 vector to used as input row by row %
% i.e there will be three graphs one for each row  %
% each row contains: a0 and k parameters          %
params = [100 0.2; 100 0.4; 100 0.8];

% declare a cell of 1x3 strings to be used as legend initial value  %
lgnd = {"", "", ""}
% loop through the rows of params vector and calculate function values %
for i = 1:3 % we have 3 input vectors  
    for j = 1:300 % time values from 0.1..30 with step 0.1 
        t(i,j) = j/10;
        funcg (i, j) =  expat(params(i,:), j/10);
    end
    % create also a legend for each graph
    lgnd{i} = sprintf("a = %1.1f \n",  params(i, 2))
end
 
%Toggle - set the "hold" state of the plotting engine
hold on

% plot the graphs
plot(t(1,:), funcg(1,:),' r', 'linewidth', 2, t(2,:), funcg(2,:),' k', 'linewidth', 2, t(3,:), funcg(3,:),' c', 'linewidth', 2)

% display specifics %
xlabel('t')
ylabel('a(t)')

% set grid on
grid on                                   

% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Decay function')

% set ticks on x-axis to improve "half-life time" visibility
set(gca, 'xtick', 0:1:30);
set(gca, 'ytick', 0:10:100);
set (gca, "xminortick", "on", "yminortick", "on")

% add a legend
legend (lgnd{1}, lgnd{2}, lgnd{3}, "location", "northeast");                
set (legend, "fontsize", 12);


% release hold
hold off