function [num_points, transformations] = getData(folderName)
oldfolder = cd(folderName);

files = dir('*.bvh');
cd(oldfolder);

num_points = 10000;
num_files = size(files,1);

transformations = struct([]);
time_step = zeros(1,num_files);

for i = 1:num_files
    [skeleton,time] = loadbvh(fullfile(folderName, files(i).name));
    
    % get absolute position
    t = zeros(size(skeleton,2), 3);
    root = skeleton(1);
    absolute_transforms = getTransforms(skeleton, t, 1, root.offsetFromParent);
    
    time_step(i) = round(0.033/(time(2)-time(1)));
    if size(time,2)/time_step(i) < num_points
        num_points = size(time,2)/time_step(i);
    end
    
    %joint_info = struct([]);
    for j = 1:size(skeleton,2)
        if size(skeleton(j).T,1) == 0
            continue;
        end
        joint_info.abs_pos = absolute_transforms(j,:);
        joint_info.t_xyz = skeleton(j).t_xyz(:,1:time_step(i):end);
        joint_info.R_xyz = skeleton(j).R_xyz(:,1:time_step(i):end);
        joint_info.T = skeleton(j).T(:,:,1:time_step(i):end);
        transformations = [transformations, joint_info];
    end
    
end

% truncate data
num_points = floor(num_points);
for i = 1:size(transformations,1)
    for j = 1:size(transformations,2)
        transformations(i,j).t_xyz = transformations(i,j).t_xyz(:,1:num_points);
        transformations(i,j).R_xyz = transformations(i,j).R_xyz(:,1:num_points);
        transformations(i,j).T = transformations(i,j).T(:,:,1:num_points);
    end
end

end