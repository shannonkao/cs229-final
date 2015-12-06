function [clusters, joints] = clusterJoints(data, k)

msize = size(data,2);
for i = 1:msize
    joints(i,1) = data(i).abs_pos(1);
    joints(i,2) = data(i).abs_pos(2);
    joints(i,3) = data(i).abs_pos(3);
    joints(i,4) = data(i).nestdepth;
    joints(i,5) = data(i).num_children;
    joints(i,6) = data(i).offsetFromParent(1);
    joints(i,7) = data(i).offsetFromParent(2);
    joints(i,8) = data(i).offsetFromParent(3);
    %joints(i,9) = getMaxAmplitude(data(i).t_xyz);
    %joints(i,10) = getMaxAmplitude(data(i).R_xyz);
end

% assign starting centroids (randomly does not work, must find better way)
centroids = zeros(k,size(joints,2));
idx = randperm(msize);
for i = 1:k
    centroids(i,:) = joints(i, :);
end

% initialize vars for k-means algorithm
oldcentroids = zeros(size(centroids));
count = 0
clusters = zeros(msize, 1);
swapped = true;

%k-means algorithm
while (swapped)
    swapped = false;
    oldclusters = clusters;
    oldcentroids = centroids;
    %find the minimum distance between each joint and the centroids
    for i = 1:msize
        min = 1000;
        for j = 1:k
            diff = norm(centroids(j,:) - joints(i,:));
            if diff < min
                min = diff;
                clusters(i) = j;
            end
        end
        if clusters(i) ~= oldclusters(i)
            swapped = true;
        end
    end
    
    % reset the centroids
    for i = 1:k
        indices = find(clusters == i);
        centroids(i,:) = mean(joints(indices, :));
    end
    count = count + 1
end

figure
hold on
for i = 1:k
    j = find(clusters == i);
    scatter3(joints(j,1), joints(j,2), joints(j,3));
end

title('Joint Clusters', 'FontSize', 14)
xlabel('x','FontSize', 14)
ylabel('y','FontSize', 14)
zlabel('z','FontSize', 14)

end