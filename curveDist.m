function [ dist ] = curveDist( x1, x2 )
% takes as input two arrays x1, x2 of xyz points
% returns the sum of squared difference 

    diff = x1 - x2;
    dist = sum(diff(:).*diff(:));

end

