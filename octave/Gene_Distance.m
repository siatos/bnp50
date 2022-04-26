% define X matrix of genes - each row is a gene expression  %
X = [6 3 3 0; 3 6 7 5; 3 2 1 2]

% find distances matrix %
for i=1:3
  for g=1:3
    sum=0
    for j=1:4
       sum = sum + (X(g,j) - X(i, j))**2   
    endfor
    dE(g,i) = sqrt(sum)
  endfor
endfor

fprintf('*****************************\n')
fprintf('Distances Matrix\n\n')
fprintf('%f %f %f\n', dE(1,:));
fprintf('%f %f %f\n', dE(2,:));
fprintf('%f %f %f\n', dE(3,:));
fprintf('*****************************\n')

% define matrix  of TF %
Y = [1, 0; 1, 1; 1, 0]


for i=1:3
  for g=1:3
    summin=0
    summax=0
    for j=1:2
       summin = summin + min(X(g,j), X(i, j))   
       summax = summax + max(X(g,j), X(i, j)) 
    endfor
    dP(g,i) = 1 - (summin/summax)
  endfor
endfor

fprintf('********************************\n')
fprintf('Promoter Distances Matrix\n\n')
fprintf('%f %f %f\n', dP(1,:));
fprintf('%f %f %f\n', dP(2,:));
fprintf('%f %f %f\n', dP(3,:));
fprintf('********************************\n')

a=0.5

Combined_Distance = dE + a*dP

fprintf('********************************\n')
fprintf('Combined Distance Matrix\n\n')
fprintf('%f %f %f\n', Combined_Distance(1,:));
fprintf('%f %f %f\n', Combined_Distance(2,:));
fprintf('%f %f %f\n', Combined_Distance(3,:));
fprintf('********************************\n')
