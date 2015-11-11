bvh = loadbvh('test.bvh');    % bvh struct
t = zeros(size(bvh,2), 3);    % transforms
root = bvh(1);                % root node

absolute_transforms = get_transforms(bvh, t, 1, root.offsetFromParent);
disp(absolute_transforms);