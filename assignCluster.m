function [c] = assignCluster(data, clusters, joints)
    
msize = size(data,2);
k = max(clusters);
for i = 1:msize
    joint(i,1) = data(i).abs_pos(1);
    joint(i,2) = data(i).abs_pos(2);
    joint(i,3) = data(i).abs_pos(3);
    joint(i,4) = data(i).nestdepth;
    joint(i,5) = data(i).num_children;
    joint(i,6) = data(i).offsetFromParent(1);
    joint(i,7) = data(i).offsetFromParent(2);
    joint(i,8) = data(i).offsetFromParent(3);
    %joints(i,9) = getMaxAmplitude(data(i).t_xyz);
    %joints(i,10) = getMaxAmplitude(data(i).R_xyz);
end

for i = 1:msize
    min = flintmax;
    for j = 1:k
        indices = find(clusters == j);
        dist = norm(mean(joints(indices, :)) - joint(i,:));
        if dist < min
            min = dist;
            c(i) = j;
        end
    end
end


end