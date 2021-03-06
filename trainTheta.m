function [theta] = trainTheta(data, t)

for i = 1:size(data,2)
    % the absolute joint positions
%     Input_x(i,1) = data(i).abs_pos(1);
%     Input_y(i,1) = data(i).abs_pos(2);
%     Input_z(i,1) = data(i).abs_pos(3);
%     joints(i,4) = data(i).nestdepth;
%     joints(i,5) = data(i).num_children;
%     joints(i,6) = data(i).offsetFromParent(1);
%     joints(i,7) = data(i).offsetFromParent(2);
%     joints(i,8) = data(i).offsetFromParent(3);

    Input(i,1) = data(i).abs_pos(1);
    Input(i,2) = data(i).abs_pos(2);
    Input(i,3) = data(i).abs_pos(3);
    Input(i,4) = data(i).nestdepth;
    Input(i,5) = data(i).num_children;
    Input(i,6) = data(i).offsetFromParent(1);
    Input(i,7) = data(i).offsetFromParent(2);
    Input(i,8) = data(i).offsetFromParent(3);
    
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

% for i = 1:t
%     inputMatrix = Input;
%     theta_tx(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Translate_x(:,i);
%     theta_ty(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Translate_y(:,i);
%     theta_tz(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Translate_z(:,i);
% 
%     theta_rx(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Rotate_x(:,i);
%     theta_ry(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Rotate_y(:,i);
%     theta_rz(:,i) = (inv(inputMatrix'*inputMatrix)*inputMatrix')*Rotate_z(:,i);
% end

alpha = .1;
numIters = 200;
init_theta = zeros(size(Input,2),1);
%init_theta = 2*rand(size(Input,2),1)-1;

for i = 1:t
    [theta_tx(:,i), cost_tx(:,i)] = gradientDescent(Input, init_theta, Translate_x(:,i), alpha, numIters);
    [theta_ty(:,i), cost_ty(:,i)] = gradientDescent(Input, init_theta, Translate_y(:,i), alpha, numIters);
    [theta_tz(:,i), cost_tz(:,i)] = gradientDescent(Input, init_theta, Translate_z(:,i), alpha, numIters);
    [theta_rx(:,i), cost_rx(:,i)] = gradientDescent(Input, init_theta, Rotate_x(:,i), alpha, numIters);
    [theta_ry(:,i), cost_ry(:,i)] = gradientDescent(Input, init_theta, Rotate_y(:,i), alpha, numIters);
    [theta_rz(:,i), cost_rz(:,i)] = gradientDescent(Input, init_theta, Rotate_z(:,i), alpha, numIters);
end

% for i = 1:size(cost_tx, 1)
%     figure
%     plot(cost_tx(:,1))
% end

plot(cost_ty(:,4))

theta.tx = theta_tx;
theta.ty = theta_ty;
theta.tz = theta_tz;
theta.rx = theta_rx;
theta.ry = theta_ry;
theta.rz = theta_rz;

end