%% requires in memory
% [t, k, data] = getData('CMU_walkcycles');
% [clusters, joints] = clusterJoints(data, k);
% theta(i) = trainTheta(jointCluster, t);

%% cluster spread metric
centroids = zeros(k,8);

for i = 1:k
    indices = find(clusters == i);
    centroids(i,:) = mean(joints(indices, :),1);
end

radius = zeros(k,1);
spread = zeros(k,1);
for i = 1:k
    indices = find(clusters == i);
    dist = 0;
    for j = 1:size(indices,1)
        for m = 1:size(indices,1)
            if m ~= j && ~isnan(norm(joints(indices(j),1:8)-joints(indices(m),1:8)))
                dist = dist+norm(joints(indices(j),1:8)-joints(indices(m),1:8));
            end
        end
    end
    radius(i) = dist/(size(indices,1) * (size(indices,1)));
    
    range = 0.0;
    for j = 1:k
        if j~=i && ~isnan(norm(centroids(i,:)-centroids(j,:)))
            range = range+norm(centroids(i,:)-centroids(j,:));
        end
    end
    spread(i) = range/k;
end

cluster_metric = radius./spread;

%% linreg avg error

error = zeros(k,1);
% for each cluster
for i = 1:k
    dist = 0;
    indices = find(clusters == i);
    % for each point in the cluster
    for j = 1:size(indices,1)
        input(1) = data(indices(j)).abs_pos(1);
        input(2) = data(indices(j)).abs_pos(2);
        input(3) = data(indices(j)).abs_pos(3);
        input(4) = data(indices(j)).nestdepth;
        input(5) = data(indices(j)).num_children;
        input(6) = data(indices(j)).offsetFromParent(1);
        input(7) = data(indices(j)).offsetFromParent(2);
        input(8) = data(indices(j)).offsetFromParent(3);
        if (size(theta(i).rx,1) > 0)
            positions(:,1) = theta(i).tx'*input';
            positions(:,2) = theta(i).ty'*input';
            positions(:,3) = theta(i).tz'*input';
        end
        diff = curveDist(positions', data(indices(j)).t_xyz);
        dist = dist + diff;
    end
    error(i) = dist/size(indices,1);
end

