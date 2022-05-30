clc;  close all;

%% load the data file  in the workspace                                    %%
%% file is in 'MATLAB formatted data' format i.e. the .mat extension       %%
%% and located in the same path as this script                             %%
load("GSE59739.mat")

%% one method to get reproducibility of the results when running k-means   %%
%% this one using a funcion handle - not used in the script                %%
%fh = @(X,K)(kmeans(X, K, 'emptyaction', 'singleton', 'replicate',5,'start','uniform'));
%evalsil = evalclusters(data, fh, 'silhouette', 'klist', [3:3], 'Distance', 'sqEuclidean')

%% the method used in the script for repoducibility is                     %%
%% to assign into the seed of the random generator always the same value   %%
%% use rng('default') command                                              %%

eval_clusters = zeros(4, 1)

%%% evaluate different silhouette metrics   %%%
%%% using k-means producing 3   clusters    %%%                        

%rng('default') % For reproducibility set seed to 1
rng(1) % For reproducibility set seed to 1
evalsil = evalclusters(data,'kmeans','silhouette', 'klist', [3:3], 'Distance', 'sqEuclidean')
eval_clusters(1,1) = evalsil.CriterionValues

%rng('default') % For reproducibility set seed to 1
rng(1) % For reproducibility set seed to 1
evalsil = evalclusters(data,'kmeans', 'silhouette', 'KList', [3:3], 'Distance', 'cosine')
eval_clusters(2,1) = evalsil.CriterionValues

%rng('default') % For reproducibility set seed to 1
rng(1) % For reproducibility set seed to 1
evalsil = evalclusters(data,'kmeans', 'silhouette', 'KList', [3:3], 'Distance', 'correlation')
eval_clusters(3,1) = evalsil.CriterionValues

rng('default') % For reproducibility set seed to 1
rng(1) % For reproducibility set seed to 1
evalsil = evalclusters(data,'kmeans', 'silhouette', 'KList', [3:3], 'Distance', 'cityblock')
eval_clusters(4,1) = evalsil.CriterionValues


%plot(eval_clusters)
sort(eval_clusters)

%%% evaluate clustering of data  using k-means                 %%%
%%% number of clusters produced is variable from 2..10         %%%
%%% metric is the same, by default sqeuclidean for all k=2..10 %%%

%rng('default') % For reproducibility
eval_cls = evalclusters(data, 'kmeans', 'silhouette', 'KList', [2:10])

plot(eval_cls)
