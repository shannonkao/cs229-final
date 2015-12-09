%% load data
clear all;

[t, k, data] = getData('CMU_walkcycles');
% t is number of time points, k is number of joint clusters
%% train data
[clusters, joints] = clusterJoints(data, k);
%%
for i = 1:k
    jointCluster = data(:, find(clusters == i));
    if size(jointCluster,2) > 0
        theta(i) = trainTheta(jointCluster, t);
    end
end

%% Train on one test skeleton then export file to visualize in Maya
[t1, k1, skel] = getData('test_walkcycle');

c = assignCluster(skel, clusters, joints);

exportAbsoluteTranslations(theta, skel, c);