clear all;

[t, data] = getData('test_walkcycles');

for i = 1:size(data,2)
    % the absolute joint positions
    Input_x(i,1) = data(i).abs_pos(1);
    Input_y(i,1) = data(i).abs_pos(2);
    Input_z(i,1) = data(i).abs_pos(3);
    
    % the translations
    Translate_x(i,:) = data(i).t_xyz(1,:);
    Translate_y(i,:) = data(i).t_xyz(2,:);
    Translate_z(i,:) = data(i).t_xyz(3,:);
    
    % the rotated joint positions
    for j = 1:t 
        rotated_vectors = data(i).T(1:3, 1:3, j)*data(i).abs_pos';
        Rotate_x(i,j) = rotated_vectors(1);
        Rotate_y(i,j) = rotated_vectors(2);
        Rotate_z(i,j) = rotated_vectors(3);
    end
    
    
end

% Normal equations (slightly modified)
theta_tx = Translate_x'*(inv(Input_x'*Input_x)*Input_x);
theta_ty = Translate_y'*(inv(Input_y'*Input_y)*Input_y);
theta_tz = Translate_z'*(inv(Input_z'*Input_z)*Input_z);

theta_rx = Rotate_x'*(inv(Input_x'*Input_x)*Input_x);
theta_ry = Rotate_y'*(inv(Input_y'*Input_y)*Input_y);
theta_rz = Rotate_z'*(inv(Input_z'*Input_z)*Input_z);