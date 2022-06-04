%%%%%%%%% Solve system of odes  %%%%%%%%%%%%%%%%%%%%%%%
% define a function that contains the system of VTG odes
function res = vtg_ode(t, V)
   randomMotion = 0.01
   diffusion = 2
   r1 = 4
   R1 = 1
   p1 = 8
   l1= 0.2
   r2 = 10
   p2 = 10
   R2 = 2
   l2 = 50
   n1 = V(1)
   n2 = V(2)
   a  = V(3)
   den1 = 1+(p1*a)
   den2 = 1+(p2*a)
   dn1dt = (r1*p1*a*n1)/den1 -(r1*n1*n1) - (R1*n1/den1) - (n1*n2)
   dn2dt = randomMotion + (r2*p2*a*n2/den2) - (r2*n2*n2) - (R2*n2/den2)     
   dadt  = diffusion - (l1*r1*n1/den1) - (l2*r2*n2*a/den2)  
   % Pack-up result
   res = [dn1dt; dn2dt; dadt];
end

