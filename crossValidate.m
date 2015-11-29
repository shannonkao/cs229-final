function [ accuracy ] = crossValidate( data, p )
% takes as input input data, set of all data points
% and p, percentage of data to use as test set

    % size of dataset
    m = size(data,2);

    % permute data
    perm = randperm(s);
    % select test set
    test = data(perm(1:s*p));
    % select training set
    training = data(perm(s*p:s));

    % t is number of joints (?)
    % train
    theta = trainTheta(training, t);

    % validate
    dist = 0;
    for i=1:size(test,2)
        pt = test(i).abs_pos;
        
        translations = [pt(1)+theta.tx pt(2)+theta.ty pt(3)+theta tz];
        
        rotated_pos = [pt(1)*theta.rx pt(2)*theta.ry pt(3)*theta.rz];
        rotations = convertRotations( pt, rotated_pos );
        
        d_t = curveDist(pt.t_xyz, translations);
        d_r = curveDist(pt.R_xyz, rotations);
        
        dist = dist + d_t + d_r;
    end
    
    accuracy = dist/size(test,2);
    
end

