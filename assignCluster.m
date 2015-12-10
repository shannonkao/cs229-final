function [c] = assignCluster(data, clusters, joints, curves)
    
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
    joint(i,9) = i;
    %joints(i,9) = getMaxAmplitude(data(i).t_xyz);
    %joints(i,10) = getMaxAmplitude(data(i).R_xyz);
end

assigned = [];
for i = 1:msize
    min = flintmax;
    for j = 1:k
        indices = find(clusters == j);
        dist = norm(mean(joints(indices, 1:8)) - joint(i,1:8));
        curve = mean(curves(joints(indices,9),:,:));
        dist = dist + curveDist(curve, curves(joint(i,9),:,:))/90.0;
        if dist < min && (size(find(assigned == j),2) == 0)
            min = dist;
            c(i) = j;
            assigned(i) = j;
        end
    end
end


end