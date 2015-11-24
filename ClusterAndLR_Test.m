clear all;

[t, k, data] = getData('CMU_walkcycles');
% t is number of time points, k is number of joint clusters
%%
clusters = clusterJoints(data, k);

for i = 1:k
    jointCluster = data(:, find(clusters == i));
    if size(jointCluster,2) > 0
        theta(i) = trainTheta(jointCluster, t);
    end
end
