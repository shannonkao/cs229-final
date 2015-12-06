function [ t_accuracy, r_accuracy ] = crossValidate( data, t, p )
% takes as input input data, set of all data points
% and p, percentage of data to use as test set

    % size of dataset
    s = size(data,2);

    % permute data
    perm = randperm(s);
    % select test set
    test = data(perm(1:floor(s*p)));
    % select training set
    training = data(perm(ceil(s*p):s));

    % t is number of time points
    % train
    theta = trainTheta(training, t);

    % validate
    t_dist = 0;
    r_dist = 0;
    for i=1:size(test,2)
        pt = test(i).abs_pos;
        
        translations = [pt(1)+theta.tx pt(2)+theta.ty pt(3)+theta.tz]';
        
        rotated_pos = [pt(1)+theta.rx pt(2)+theta.ry pt(3)+theta.rz];
        rotations = convertRotations( pt, rotated_pos )';
        
        d_t = curveDist(test(i).t_xyz, translations);
        d_r = curveDist(test(i).R_xyz, rotations);
        
        t_dist = t_dist + d_t/sum(abs(test(i).t_xyz(:)));
        r_dist = r_dist + d_r/360.0;
    end
    
    t_accuracy = t_dist/size(test,2);
    r_accuracy = r_dist/size(test,2);
    
end

