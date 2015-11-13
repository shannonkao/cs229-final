function [ t, r ] = closestJoint( joints, pos )
% matrix of structs of all rigs and joints
% joints.abs_pos  [x y z]
% joints.t_xyz    [array of 3x1 vectors]
% joints.R_xyz    [array of 3x1 vectors]

    best = [1,1];
    dist = inf;
    for i=1:size(joints,1)
        for j=1:size(joints,2)
            d = norm(pos - joints(i,j).abs_pos);
            if (d < dist) 
                dist = d;
                best = [i, j];
            end
        end
    end
    
    t = joints(best(1), best(2)).t_xyz;
    r = joints(best(1), best(2)).R_xyz;

end

