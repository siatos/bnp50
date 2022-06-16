%%%%%%%%% Solve system of odes  %%%%%%%%%%%%%%%%%%%%%%%
% define a function that contains the system of odes
function res = template_odes(t,V)
  
    % independent variables V - vector of v1 & v2 & v3 these are x, y, z
    % v1 
    % v2  
    v1 = V(1);  % X(t)
    v2 = V(2);  % Y(t)
    v3 = V(3);  % Z(t) 
    % set of param set depends on time
    a = 10;
    b = 0.3;
    gama = 0.3; 
    d = 0.05;
    zeta = 2;
    c = 2;
    e = 0.6;
    f = 20;

    dxdt = a*v1 - b*v1 - gama*v1*v2 - d*v1*v3;        % rate of  X
    dydt = zeta *v2 - c*v2 + gama*v2*v1 - e*v2*v3;     % rate of  Y
    dzdt = (-1)*f*v3 + d*v1 + e*v3*v2;                % rate of  Z
    % Pack-up result
    res = [dxdt; dydt; dzdt];
end

