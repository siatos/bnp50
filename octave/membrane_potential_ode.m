clear all; 
clf;
v0(1) = -100;
%% Function definition %%%
function res = membrane_potential(t,V, p)
   v1 = V(1)
   % p is 1x4 vector for the parameters of the equation
   E  = p(1)  % E = Nernst potential
   G  = p(2)  % G = conductance of the membrane
   C  = p(3)  % C = capacitance    
   dxdt = (p(2)/p(3))*(p(1) - v1) ;
   res = [dxdt];
end;



params = [-75 0.02 0.04]
Tinterval = linspace(0, 8, 101)
rate = @(t,V) membrane_potential(t,V, params);
[T,V1] = ode45(rate, Tinterval, -100);
[T,V2] = ode45(rate, Tinterval, -50);
[T,V3] = ode45(rate, Tinterval, -75);

params = [-75 1.0 0.04]
rate = @(t,V) membrane_potential(t,V, params);
[T,V4] = ode45(rate, Tinterval, -100);

params = [-75 1.0 0.4]
rate = @(t,V) membrane_potential(t,V, params);
[T,V5] = ode45(rate, Tinterval, -100);

h = plot(T, V1(:), 'r', 'linewidth', 1.5, 
         T, V2(:), 'r', 'linewidth', 1.5, 
         T, V3(:), 'r', 'linewidth', 1.5, 
         T, V4(:), 'b', 'linewidth', 1.5,
         T, V5(:), 'b', 'linewidth', 1.5)
   
           
