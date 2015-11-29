function [ rot ] = convertRotations( initial_position, pts )
% takes as input an initial joint position 
% and an array of xyz points represented rotated
% positions. 
% 
% outputs a vector of xyz euler rotations, each
% incremental from the previous rotation

    rot = zeros(size(pts));
    prev = initial_position;
    for i=1:size(pts,2)
        axisangle = vrrotvec(prev, pts(i,:));
        quat = axang2quat(axisangle);
        rot(i, :) = quat2angle(quat);
        prev = pts(i,:);
    end

end

