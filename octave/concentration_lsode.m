clear all

% Initial conditions (s1 = 0, s2 = 0)
initial_values = [0, 0];
times = 0:0.02:5;

function dsdt = concetration1(s,t) 

	% Constant parameters of the ODE
	
  % Provided quantities
  k1 = 20;		
  k2 = 5;		
  k3 = 5;		
  k4 = 5;		
  k5 = 2;		
  K = 1;		
  n = 4


	dsdt(1) = k1/(1+power((s(2)/K), n))-k3*s(1)-k5*s(1);
	dsdt(2) = k2 + k5*s(1)-k4*s(2)

endfunction

function dsdt = concetration2(s,t) 

	% Constant parameters of the ODE
	
  % Provided quantities
  k1 = 30;		
  k2 = 6;		
  k3 = 6;		
  k4 = 6;		
  k5 = 3;		
  K = 2;		
  n = 5

	dsdt(1) = k1/(1+power((s(2)/K), n))-k3*s(1)-k5*s(1);
	dsdt(2) = k2 + k5*s(1)-k4*s(2)

endfunction

function dsdt = concetration3(s,t) 

	% Constant parameters of the ODE
	
  % Provided quantities
  k1 = 10;		
  k2 = 2;		
  k3 = 2;		
  k4 = 2;		
  k5 = 2;		
  K = 1;		
  n = 3

	dsdt(1) = k1/(1+power((s(2)/K), n))-k3*s(1)-k5*s(1);
	dsdt(2) = k2 + k5*s(1)-k4*s(2)

endfunction


% Find the trajectories of s1 & s2 1st case
trajectory1 = lsode("concetration1", initial_values, times);

% Find the trajectories of s1 & s2 2nd case
trajectory2 = lsode("concetration2", initial_values, times);

% Find the trajectories of s1 & s2 2nd case
trajectory3 = lsode("concetration3", initial_values, times);

plot(times, trajectory1, 'linewidth', 1, times,  trajectory2, 'linewidth', 2, times, trajectory3, 'linewidth', 3)
