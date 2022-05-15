%%%%% Capillary-like Networks %%%%%

% open a file to write output %
fh = fopen('result.txt','w');

%%%%% Input S & CLN matrices to calculate      %%%%%%
S = [12, 4, 6, 4; 16, 12, 2, 3;0, 4, 10, 12;4, 12, 21, 3]
%CLN = [50, 50, 50, 50; 50, 50, 50, 50;50, 50, 50, 50;50, 50, 50, 50]
CLN = [100, 100, 100, 100; 100, 100, 100, 100; 100, 100, 100, 100; 100, 100, 100, 100]

function Vlist = convert_2_list(V)
    %%% converts a square nxn matrin into a 1xn^2 matrix
    %%% first transose the matrix and then convert
    V_dash = V'
    Vlist  = V_dash(:)
    Vlist = Vlist'
endfunction
  


fprintf(fh, "============================================\n")
fprintf(fh, "S:              & CLN:            @step: %d - (Initial State)\n", 0)
fprintf(fh, '%2d %2d %2d %2d | %2d %2d %2d %2d  \n', S(1,:), CLN(1,:));
fprintf(fh, '%2d %2d %2d %2d | %2d %2d %2d %2d  \n', S(2,:), CLN(2,:));
fprintf(fh, '%2d %2d %2d %2d | %2d %2d %2d %2d  \n', S(3,:), CLN(3,:));
fprintf(fh, '%2d %2d %2d %2d | %2d %2d %2d %2d  \n', S(4,:), CLN(4,:));
fprintf(fh, "============================================\n")

CLN_set=zeros(4,16)
S_set=zeros(4,16)

%%% convert initial given values from a 4x4 to 1x16
CLN_list = convert_2_list(CLN)
S_list = convert_2_list(S)
for t = 1:16
   CLN_set(1, t) = CLN_list(1, t)
   S_set(1, t) = S_list(1, t)
end
   
for k=1:12    %repetitions 12 in total%
   for i=1:4
       for j=1:4
           if S(i,j) < 5
               CLN(i,j) = CLN(i, j) - 0.5*S(i, j)     % decrease value of CLN(i,j) since S(i, j) < 5
               if CLN(i,j) < 0
	               CLN(i, j) = 0                      % value cannot be negative  
               end    
           else
               CLN(i,j) = CLN(i, j) + 0.5*S(i, j)   % increase value of CLN(i,j) since S(i, j) >= 5
		       end
           S(i, j) = S(i, j) - 2                  % decrease respective S(i, j) in every repetition  
           if S(i, j) < 0
               S(i, j) = 0
           end
       end
   end
   fprintf(fh, "===========================================\n")
   fprintf(fh, "S:              & CLN:            @step: %d\n", k)
   fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(1,:), CLN(1,:));
   fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(2,:), CLN(2,:));
   fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(3,:), CLN(3,:));
   fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(4,:), CLN(4,:));
   fprintf(fh, "============================================\n") 
   if rem(k, 4) == 0
       fprintf(fh, "\n======> cycle: %d i.e. %d repetitions completed \n\n", int32(k/4), k)
       %CLN_dash = CLN'
       %CLN_list = CLN_dash(:)
       CLN_list = convert_2_list(CLN)
       S_list = convert_2_list(S)
       step = (k/4)+1 %%% i.e. step can only be 2, 3 &  4, we already have row 1 with the initial values
       for t = 1:16
           CLN_set(step, t) = CLN_list(1, t)
           S_set(step, t) = S_list(1, t)
       end
   end
end 

%plots 
j=1:16
figure(1)
plot(j, S_set(1, :), 'r', j, S_set(2, :), 'b', j, S_set(3, :), 'y', j, S_set(4, :), 'k')
title('S-values')
ylabel('S value')
figure(2)
plot(j, CLN_set(1, :), 'r', j, CLN_set(2, :), 'b', j, CLN_set(3, :), 'y', j, CLN_set(4, :), 'k')
title('CLN-values')
ylabel('CLN value')

fclose(fh);  % close file %