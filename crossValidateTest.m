clear all;

%[t, k, data] = getData('CMU_walkcycles');
% t is number of time points, k is number of joint clusters
bvh_data = load('bvh_data.mat');
bvh_t = load('bvh_t.mat');
t = bvh_t.t;
data = bvh_data.data;
% k from getData
k = 31;
clusters = clusterJoints(data, k);

translation = zeros(k, 1);
rotation = zeros(k, 1);
for i = 1:k
    jointCluster = data(:, find(clusters == i));
    if size(jointCluster,2) > 0
        [t_a, r_a] = crossValidate( data, t, 0.2 );
        translation(i) = t_a;
        rotation(i) = r_a;
    end
end

translation
rotation