bvh = loadbvh('test.bvh');    % bvh struct
t = zeros(size(bvh,2), 3);    % transforms
root = bvh(1);                % root node

absolute_transforms = getTransforms(bvh, t, 1, [0,0,0]');
disp(absolute_transforms);