function [ transforms ] = getTransforms( tree, transforms, node, parent_t )
% @param tree           output of loadbvh
% @param transforms     empty matrix of dimension # nodes x 3
% @param node           index of current node
% @param parent_t       absolute translation of parent
% @return an array with the absolute position of the joint at that index

    t = tree(node).offsetFromParent; % xyz translation
    children = tree(node).children;
    for i=1:size(children,2)
        transforms = getTransforms(tree, transforms, children(i), t);
    end
    transforms(node,:) = t + parent_t;
end

