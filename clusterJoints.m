function [clusters] = clusterJoints(data, k)

msize = size(data,2);
for i = 1:msize
    joints(i,:) = data(i).abs_pos;
end

% randomly assign starting centroids
centroids = zeros(k,3);
idx = randperm(msize);
for i = 1:k
    centroids(i,:) = joints(idx(i), :);
end

% initialize vars for k-means algorithm
oldcentroids = zeros(size(centroids));
count = 0
clusters = zeros(msize, 1);
swapped = true;

%k-means algorithm
while (clusterConverged(oldcentroids, centroids))
    %swapped = false;
    %oldclusters = clusters;
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
%         if clusters(i) ~= oldclusters(i)
%             swapped = true;
%         end
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