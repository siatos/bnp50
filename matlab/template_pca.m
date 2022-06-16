clc; close all;
%% use package statistics so we need to load it first - only for Octave   %%
% pkg load statistics   % holds only for Octave in MATLAB gives Error

data = [randn(50,30); randn(50,30)+5];

[coeff, score]= pca(data)
figure(1)

for j=1:100
    if j < 50
        colors(j,:) = [1 0 0]    %% red       
    else
        colors(j, :) = [0 0 0]   %% black
    end
end
scatter(score (:,1), score(:,2),[], colors)
title('pca plot: 2 main components')
xlabel('pca 1st component')
ylabel('pca 2nd component')

k=2;
R = 8;
for j =1:5
    minimized_data (:,j) = score(:,j)
end    
figure(2)
[idx, centers] = kmeans(minimized_data, k, 'Replicates', R);
[s, h] = silhouette(minimized_data, idx);

