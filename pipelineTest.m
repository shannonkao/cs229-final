display('Loading data...');
[t, k, data] = getData('test_walkcycles');
clusters = clusterJoints(data, k);

translation = zeros(k, 1);
rotation = zeros(k, 1);
for i = 1:k
    display(sprintf('Linear regression on cluster %d...', i));
    jointCluster = data(:, find(clusters == i));
    if size(jointCluster,2) > 0
        [t_a, r_a] = crossValidate( data, t, 0.2 );
        translation(i) = t_a;
        rotation(i) = r_a;
    end
end

translation
rotation