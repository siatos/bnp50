%%%%% Calculate SVD for a givem matrix %%%%%

% open a file to write output %
fh = fopen('result.txt','w');

%%%%% Input matrix A to calculate      %%%%%%
A = [6,4; 4,0]

%%%%%% Find SVD of A %%%%%%
[U, S, V] = svd(A)

%%%%% since A is 2x2 all matrices S, U & V will be 2x2 %%%%%%%%%

%%%%% print in the ouput file initial matrix A row by row %%%%%%
fprintf(fh, '**************** results *****************\n')
fprintf(fh, 'Initial A:\n');
fprintf(fh, '%f %f\n', A(1,:));
fprintf(fh, '%f %f\n', A(2,:));
fprintf(fh, '\n')

%%%%% print in the output file diagonal matrix S row by row %%%%%%%
fprintf(fh, 'SVD diagonal S:\n');
fprintf(fh, '%f %f\n', S(1,:));
fprintf(fh, '%f %f\n', S(2,:));
fprintf(fh, '\n')

%%%%% print in the output file U (left singular matrxi) row by row %%%%%
fprintf(fh, 'Left Singular U:\n');
fprintf(fh, '%f %f\n', U(1,:));
fprintf(fh, '%f %f\n', U(2,:));
fprintf(fh, '\n')

%%%%% print in the output file V (right singular matrxi) row by row %%%%%fprintf(fh, 'Right Singular V:\n');
fprintf(fh, 'Right Singular V:\n');
fprintf(fh, '%f %f\n', V(1,:));
fprintf(fh, '%f %f\n', V(2,:));

fprintf(fh, '*****************************************\n')
fprintf(fh, '\n\n')


fprintf('running for a magic 5x5 matrix...')
fprintf('a new (magic) matrix M will be created ...\n')

M = magic(5)

%%%%% Find SVD of M %%%%%%%
[U, S, V] = svd(M)

%%%%%%% print initial matrix M row by row %%%%%%%%%%
%%%%% since M is 5x5 all matrices S, U & V will be 5x5 %%%%%%%%%
fprintf(fh, '***** results for the magic matrix M ******\n')
fprintf(fh, 'Initial magic M:\n');
fprintf(fh, '%f %f %f %f %f\n', M(1,:));
fprintf(fh, '%f %f %f %f %f\n', M(2,:));
fprintf(fh, '%f %f %f %f %f\n', M(3,:));
fprintf(fh, '%f %f %f %f %f\n', M(4,:));
fprintf(fh, '%f %f %f %f %f\n', M(5,:));
fprintf(fh, '\n')

%%%%%%% print diagonal S row by row %%%%%
fprintf(fh, 'SVD diagonal S:\n');
fprintf(fh, '%f %f %f %f %f\n', S(1,:));
fprintf(fh, '%f %f %f %f %f\n', S(2,:));
fprintf(fh, '%f %f %f %f %f\n', S(3,:));
fprintf(fh, '%f %f %f %f %f\n', S(4,:));
fprintf(fh, '%f %f %f %f %f\n', S(5,:));
fprintf(fh, '\n')
fprintf(fh, '*******************************************\n')
fclose(fh);  % close file %
