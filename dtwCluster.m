function [clusters, joints] = dtwCluster(data, k)

msize = size(data,2);
for i = 1:msize
    joints(i,1,:) = data(i).R_xyz(1,:);
    joints(i,2,:) = data(i).R_xyz(2,:);
    joints(i,3,:) = data(i).R_xyz(3,:);
    %joints(i,4,:) = data(i).R_xyz(1,:);
    %joints(i,5,:) = data(i).R_xyz(2,:);
    %joints(i,6,:) = data(i).R_xyz(3,:);
end

centroids = zeros(k,size(joints,2), size(joints,3));
idx = randperm(msize);
for i = 1:k
    centroids(i,:,:) = joints(idx(i), :,:);
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
        min = flintmax;
        for j = 1:k
            diff = curveDist(centroids(j,:,:), joints(i, :, :));
            %diff = norm(centroids(j,1:8) - joints(i,1:8));
            %diff = diff + curveDist(curves(centroids(j,9),:,:), curves(joints(i,9),:,:));
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
        %if size(indices,1) == 0
        %    centroids(i,:,:) = joints(ceil(rand*msize), :,:);
        %elseif size(indices,1) == 1
        %    centroids(i,:,:) = joints(indices, :,:);  
        %else   
            centroids(i,:,:) = mean(joints(indices, :,:),1);
        %end
    end
    count = count + 1
end

%%
figure
hold on
msize = size(data,2);
for i = 1:msize
    vis(i,1) = data(i).abs_pos(1);
    vis(i,2) = data(i).abs_pos(2);
    vis(i,3) = data(i).abs_pos(3);
end

for i = 1:k
    j = find(clusters == i);
    scatter3(vis(j,1), vis(j,2), vis(j,3));
end

title('Joint Clusters', 'FontSize', 14)
xlabel('x','FontSize', 14)
ylabel('y','FontSize', 14)
zlabel('z','FontSize', 14)


end