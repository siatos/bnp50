clc; close all;
%% use package statistics so we need to load it first - only for Octave   %%
% pkg load statistics   % holds only for Octave in MATLAB gives Error

%% load the data file  in the workspace                                   %%
%% file is in 'MATLAB formatted data' format i.e. the .mat extension      %%
%% and located in the same path as this script                            %%
load("GSE59739.mat")

%% List variables in workspace, with sizes and types, after file load     %%
whos('-file','GSE59739.mat')


%% erothma 1  - (q1)                                                      %%
tabulate(class)
%% End of q1                                                              %%

%% erothma 2  -(q2)                                                       %%
%% classify data using kmeans and different metrics                       %%
%% data will be split into 3 clusters                                     %%  

%% 1st metric: sqeuclidean                                                %%
meansil = zeros(4,1);
% use the below 2 lines or just the one below the 2 but not together
% these 2 
%rng(1)  % For reproducibility
%[idx1, centers1] = kmeans(data, 3, "distance", "sqeuclidean");
% or this one
[idx1, centers1] = kmeans(data, 3, "distance", "sqeuclidean", "Replicates",5);
figure(1)
[s1, h1] = silhouette(data, idx1, 'sqeuclidean');
title('Silhouette graphs for data using sqeuclidean distance metric')
meansil(1,1) = mean(s1)

%% 2nd metric: cosine                                                     %%
% use the below 2 lines or just the one below the 2 but not together
% these 2 
%rng(1)  % For reproducibility
%[idx2, centers2] = kmeans(data, 3, "distance", "cosine");
% or this one
[idx2, centers2] = kmeans(data, 3, "distance", "cosine", "Replicates", 5);
figure(2)
[s2, h2] = silhouette(data, idx2, 'cosine');
title('Silhouette graphs for data using cosine distance metric')
meansil(2,1) = mean(s2)

%% 3rd metric: correlation                                                %%
% use the below 2 lines or just the one below the 2 but not together
% these 2 
%rng(1)  % For reproducibility
%[idx2, centers2] = kmeans(data, 3, "distance", "cosine");
% or this one
[idx3, centers3] = kmeans(data, 3, "distance", "correlation", "Replicates", 5);
figure(3)
[s3, h3] = silhouette(data, idx3, 'correlation');
title('Silhouette graphs for data using correlation distance metric')
meansil(3,1) = mean(s3)

%% 4th metric: cityblock                                                  %%
% use the below 2 lines or just the one below the 2 but not together
% these 2 
%rng(1)  % For reproducibility
%[idx2, centers2] = kmeans(data, 3, "distance", "cosine");
% or this one
[idx4, centers4] = kmeans(data, 3, "distance", "cityblock", "Replicates", 5);
figure(4)
[s4, h4] = silhouette(data, idx4, 'cityblock');
title('Silhouette graphs for data using cityblock distance metric')
meansil(4,1) = mean(s4)

%%  plot mean values of silhouette values of the samples for each case    %%  
figure(5)
j=1:4
scatter(j, meansil(j,1))
xlabel('type of silhoutte metric')
ylabel('mean silhouette value')
legend("1:eucl 2:cos 3:cor 4:city", "Location","northeast")
set(legend, "fontsize", 12);


%% End of q2                                                              %%  


%% erothma 3 -(q3)                                                           %%
%% classify data using kmeans and different numbers of clusters in each case %%
% metric is the same in every case, default: sqeuclidean                      %%
%% data will be split into k=2..10 clusters                                  %%  

mean_of_sil = zeros(1,9);
for k=2:10
  %rng(1) % For reproducibility
  %idx= kmeans(data, k);
  idx= kmeans(data, k, "Replicates", 8);
     s = silhouette(data, idx);
    mean_of_sil(1, k-1) = mean(s); 
end

figure(6)

plot(mean_of_sil)
xlabel('kmeans k values')
ylabel('silhouette value')


%% End of q3                                                              %%  


%% erothma 4 -(q4)%%

%% use PCA to reduce 25333 vars to only 2 for the 864 samples i.e. we get    %%
%% a 864x2 vector                                                                                                       %%
%% this 864x2 vector will be plotted in a scatter plot using different color %%
%% for every point depending on the cluster the point belongs to i.e         %%
%% a total of 3 colors will be used since there will be 3 cluster since we   %%
%% will be using a k-means with k=3                                          %%
%[coeff, score]= pca(data, "Economy", true, NumComponents=2)
[coeff, score]= pca(data)


%% run k-means to split in 3 clusters                                     %% 
% rng(1) % For reproducibility
% [idx, centers] = kmeans(data, 3)
% this time we do not set seed to a certain fixed value instead we let
% k-means to replicate results for 8 runs to avoid local minima if possible
[idx, centers] = kmeans(data, 3, 'Replicates', 8);

%% each point in scatter plot will have color depending on the cluster it belongs to  %%
colors = zeros(864, 3)     
for j=1:864
    if idx(j, 1) == 1
        colors(j,:) = [1 0 0]    %% red       
    elseif  idx(j, 1) == 2
        colors(j, :) = [0 1 0]   %% green
    else
        colors(j, :) = [0 0 0]   %% black
    end
end
figure(7)
scatter(score (:,1), score(:,2),[], colors)
title('pca plot: 2 main components')
xlabel('pca 1st component')
ylabel('pca 2nd component')


%% End of q4                                                             %%  

%% display the frequencies of the 'class' variable as shown from previous %%
%% who is: there are two variables: 'class' and 'data'                    %%
%% Plot a hist of class data                                              %%
figure(8)
hist(class)
title('Class Historgramm')
xlabel('classes')
ylabel('class members')


