clear all; clf;

% gompertz function %
function f_gomp = gompertz(m, x)
  % input m: a vector i.e. 3-tuple  of v0, a, b           %
  % input x:  represents time t steps                     %
  % define locals to conform with the given function      %
  % not really necessary but gives better visual display  % 
  c  = m(2)/m(3);    %  c=m(2)/m(3) is a/b in the original equation
  v0 = m(1)          %  v0=v(0)=1 given 
  b  = m(3)          %  m(3) is b in the original equation 
	f_gomp =  v0*exp(c*(1-exp(-b*x))) 
end;

clear;

% declare a 3x3 vector to used as input row by row %
% i.e there will be three graphs one for each row  %
% each row  contains: v0, a and b parameters        %
params = [1 1 0.055; 1 0.5 0.03; 1 0.8 0.04];

% declare a cell of 1x3 strings to be used as legend initial value  %
lgnd = {"", "", ""}

% loop through the rows of params vector and calculate function values %
for i = 1:3 % we have 3 input vectors     
    for j = 1:3000 % time values from 0.1..300 with step 0.1 
        % a trick to provide time in steps instead of providing time with a vector
        % obviously t(1,:)= t(2,:) = t(3, :) = t vector with values 0.1..300 step 0.1
        t(i,j) = j/10;
        funcg (i,j) = gompertz(params(i,:), t(i,j));
    end
    % create also a legend for each graph
    lgnd{i} = sprintf("a = %1.3f b = %1.3f c = %2.3f\n",  params(i, 2), params(i, 3), params(i, 2)/params(i, 3))
end
 
%Toggle - set the "hold" state of the plotting engine
hold on

% plot the graphs
plot(t(1,:), funcg(1,:),' r', 'linewidth', 2, t(2,:), funcg(2,:),' k', 'linewidth', 2, t(3,:), funcg(3,:),' c', 'linewidth', 2)

% display specifics %
xlabel('t')
ylabel('V(t)')

% set grid on
grid on                                   

% additional display properties
set(gca, 'fontsize', 24, 'linewidth', 1)  
title('Gompertz function')
% add a legend
legend (lgnd{1}, lgnd{2}, lgnd{3}, "location", "northeast");                
set (legend, "fontsize", 12);

% release hold
hold off
