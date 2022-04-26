% open a file to write output %
fh = fopen('result.txt','w');
A = [6,4; 4,0]
% Find SVD of A %
[U, S, V] = svd(A)
% print initial matrix A row by row %
fprintf(fh, '**************** results *****************\n')
fprintf(fh, 'Initial A:\n');
fprintf(fh, '%f %f\n', A(1,:));
fprintf(fh, '%f %f\n', A(2,:));
fprintf(fh, '\n')
% print diagonal S row by row %
fprintf(fh, 'SVD diagonal S:\n');
fprintf(fh, '%f %f\n', S(1,:));
fprintf(fh, '%f %f\n', S(2,:));
fprintf(fh, '\n')
% print U left singular row by row %
fprintf(fh, 'Left Singular U:\n');
fprintf(fh, '%f %f\n', U(1,:));
fprintf(fh, '%f %f\n', U(2,:));
fprintf(fh, '\n')
% print V right singular row by row %
fprintf(fh, 'Right Singular V:\n');
fprintf(fh, '%f %f\n', V(1,:));
fprintf(fh, '%f %f\n', V(2,:));
fprintf(fh, '*****************************************\n')
fprintf(fh, '\n\n')

fprintf('running for a magic 5x5 matrix\n')
M = magic(5)
% Find SVD of M %
[U, S, V] = svd(M)
% print initial matrix M row by row %
             
fprintf(fh, '***** results for the magic matrix M ******\n')
fprintf(fh, 'Initial magic M:\n');
fprintf(fh, '%f %f %f %f %f\n', M(1,:));
fprintf(fh, '%f %f %f %f %f\n', M(2,:));
fprintf(fh, '%f %f %f %f %f\n', M(3,:));
fprintf(fh, '%f %f %f %f %f\n', M(4,:));
fprintf(fh, '%f %f %f %f %f\n', M(5,:));
fprintf(fh, '\n')
% print diagonal S row by row %
fprintf(fh, 'SVD diagonal S:\n');
fprintf(fh, '%f %f %f %f %f\n', S(1,:));
fprintf(fh, '%f %f %f %f %f\n', S(2,:));
fprintf(fh, '%f %f %f %f %f\n', S(3,:));
fprintf(fh, '%f %f %f %f %f\n', S(4,:));
fprintf(fh, '%f %f %f %f %f\n', S(5,:));
fprintf(fh, '\n')
fprintf(fh, '*******************************************\n')
fclose(fh);  % close file %
