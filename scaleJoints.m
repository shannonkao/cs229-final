function [scaled_t] = scaleJoints( absolute_transforms, transformations )

    y_max = max(absolute_transforms(:,2));
    y_min = min(absolute_transforms(:,2));
    height = y_max - y_min;

    for i = 1:size(transformations,2)
        transformations(i).abs_pos = transformations(i).abs_pos ./ height;
        transformations(i).t_xyz = transformations(i).t_xyz ./ height;
    end
    
    scaled_t = transformations;
end

