function [scaled_t] = scaleJoints( abs_pos, t )
    x_max = max(abs_pos(:,1));
    x_min = min(abs_pos(:,1));
    x_scale = x_max - x_min;
    x_trans = x_min + x_scale/2;
    
    y_max = max(abs_pos(:,2));
    y_min = min(abs_pos(:,2));
    y_scale = y_max - y_min;
    y_trans = y_min + y_scale/2;

    z_max = max(abs_pos(:,3));
    z_min = min(abs_pos(:,3));
    z_scale = z_max - z_min;
    z_trans = z_min + z_scale/2;
    
    translation = [x_trans y_trans z_trans];
    
    for i = 1:size(t,2)
        t(i).abs_pos = (t(i).abs_pos - translation) .* 10/y_scale;

        t(i).t_xyz = bsxfun(@minus, t(i).t_xyz, translation');
        t(i).t_xyz = t(i).t_xyz .* 10/y_scale;
    end
    
    scaled_t = t;
end

