function [ rot ] = convertRotations( initial_position, pts )
% takes as input an initial joint position 
% and an array of xyz points represented rotated
% positions. 
% 
% outputs a vector of xyz euler rotations, each
% incremental from the previous rotation

    rot = zeros(size(pts));
    prev = initial_position;
    for i=1:size(pts,1)
        axang = vrrotvec(prev, pts(i,:));
        axang(4) = axang(4)*180.0/pi;
        euler = SpinCalc('EVtoEA213', axang, 0.01);% axang2quat(axang); % can't access this func? :(
        rot(i, :) = euler; % quat2angle(euler); % used with axang2quat
        prev = pts(i,:);
    end

end

