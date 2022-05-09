%%%%% Capillary-like Networks %%%%%

% open a file to write output %
fh = fopen('result.txt','w');

%%%%% Input S & CLN matrices to calculate      %%%%%%
S = [12, 4, 6, 4; 16, 12, 2, 3;0, 4, 10, 12;4, 12, 21, 3]
CLN = [50, 50, 50, 50; 50, 50, 50, 50;50, 50, 50, 50;50, 50, 50, 50]

fprintf(fh, "============================================\n")
fprintf(fh, "S:              & CLN:            @step: %d - (Initial State)\n", 0)
fprintf(fh, '%2d %2d %2d %2d | %02d %02d %02d %02d  \n', S(1,:), CLN(1,:));
fprintf(fh, '%2d %2d %2d %2d | %02d %02d %02d %02d  \n', S(2,:), CLN(2,:));
fprintf(fh, '%2d %2d %2d %2d | %02d %02d %02d %02d  \n', S(3,:), CLN(3,:));
fprintf(fh, '%2d %2d %2d %2d | %02d %02d %02d %02d  \n', S(4,:), CLN(4,:));
fprintf(fh, "============================================\n")


for k=1:12
  for i=1:4
    for j=1:4
      if S(i,j) < 5
        CLN(i,j) = CLN(i, j) - 0.5*S(i, j)
        if CLN(i,j) < 0
	        CLN(i, j) = 0
         endif    
      else
        CLN(i,j) = CLN(i, j) + 0.5*S(i, j)
		  endif
      S(i, j) = S(i, j) - 2
      if S(i, j) < 0
        S(i, j) = 0     
      endif
    endfor
  endfor
  fprintf(fh, "===========================================\n")
  fprintf(fh, "S:              & CLN:            @step: %d\n", k)
  fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(1,:), CLN(1,:));
  fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(2,:), CLN(2,:));
  fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(3,:), CLN(3,:));
  fprintf(fh, '%2d %2d %2d %2d | %3d %3d %3d %3d  \n', S(4,:), CLN(4,:));
  fprintf(fh, "============================================\n")
endfor 

  

fclose(fh);  % close file %