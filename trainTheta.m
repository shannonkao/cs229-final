function [theta] = trainTheta(data, t)

for i = 1:size(data,2)
    % the absolute joint positions
    Input_x(i,1) = data(i).abs_pos(1);
    Input_y(i,1) = data(i).abs_pos(2);
    Input_z(i,1) = data(i).abs_pos(3);
%     joints(i,4) = data(i).nestdepth;
%     joints(i,5) = data(i).num_children;
%     joints(i,6) = data(i).offsetFromParent(1);
%     joints(i,7) = data(i).offsetFromParent(2);
%     joints(i,8) = data(i).offsetFromParent(3);
    
    % the translations
    Translate_x(i,:) = data(i).t_xyz(1,:);
    Translate_y(i,:) = data(i).t_xyz(2,:);
    Translate_z(i,:) = data(i).t_xyz(3,:);
    
    % the rotations
    Rotate_x(i,:) = data(i).R_xyz(1,:);
    Rotate_y(i,:) = data(i).R_xyz(2,:);
    Rotate_z(i,:) = data(i).R_xyz(3,:);
    
    % the rotated joint positions
%     for j = 1:t 
%         rotated_vectors = data(i).T(1:3, 1:3, j)*data(i).abs_pos';
%         Rotate_x(i,j) = rotated_vectors(1);
%         Rotate_y(i,j) = rotated_vectors(2);
%         Rotate_z(i,j) = rotated_vectors(3);
%     end
    
    
end

% Normal equations (slightly modified)
% Matrix inversion sometimes fails when input is (0,0,0), outputs Nans.
% if sum(sum(Input_x + Input_y + Input_z)) == 0
%     small_epsilon = 0.00001;
%     Input_x = Input_x + small_epsilon;
%     Input_y = Input_y + small_epsilon;
%     Input_z = Input_z + small_epsilon;
% end

theta.tx = (inv(Input_x'*Input_x)*Input_x')*Translate_x;
theta.ty = (inv(Input_y'*Input_y)*Input_y')*Translate_y;
theta.tz = (inv(Input_z'*Input_z)*Input_z')*Translate_z;

theta.rx = (inv(Input_x'*Input_x)*Input_x')*Rotate_x;
theta.ry = (inv(Input_y'*Input_y)*Input_y')*Rotate_y;
theta.rz = (inv(Input_z'*Input_z)*Input_z')*Rotate_z;

end