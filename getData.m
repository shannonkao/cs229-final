function [num_points, max_num_joints, transformations] = getData(folderName)
oldfolder = cd(folderName);

files = dir('*.bvh');
cd(oldfolder);

num_points = 10000;
num_files = size(files,1);

transformations = struct([]);
time_step = zeros(1,num_files);

max_num_joints = 0;

for i = 1:num_files
    [skeleton,time] = loadbvh(fullfile(folderName, files(i).name));

    % get absolute position
    t = zeros(size(skeleton,2), 3);
    root = skeleton(1);
    absolute_transforms = getTransforms(skeleton, t, 1, [0,0,0]');
    
    time_step(i) = round(0.033/(time(2)-time(1)));
    if size(time,2)/time_step(i) < num_points
        num_points = size(time,2)/time_step(i);
    end
    
    num_joints = 0;
    all_joints = [];
    for j = 1:size(skeleton,2)
        
        %do not include joints without tranformations
        if size(skeleton(j).T,1) == 0  
            continue;
        end
        
        joint_info.abs_pos = absolute_transforms(j,:);
        joint_info.t_xyz = skeleton(j).t_xyz(:,1:time_step(i):end);
        joint_info.R_xyz = skeleton(j).R_xyz(:,1:time_step(i):end);
        joint_info.T = skeleton(j).T(:,:,1:time_step(i):end);
        joint_info.nestdepth = skeleton(j).nestdepth;
        joint_info.num_children = size(skeleton(j).children,2);
        joint_info.offsetFromParent = skeleton(j).offsetFromParent;
        
        all_joints = [all_joints joint_info];
        
        num_joints = num_joints + 1;
    end
    
    all_joints = scaleJoints(absolute_transforms, all_joints);
    transformations = [transformations, all_joints];
    
    if max_num_joints < num_joints
        max_num_joints = num_joints;
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