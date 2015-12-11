function [ dist ] = curveDist( c1, c2 )
% takes as input two arrays x1, x2 of xyz points
% returns the sum of squared difference 

    
    %diff = ( x1 - x2 );
    %dist = sum(diff(:).*diff(:))/size(diff(:),1);
    
    %dist = dist/sum(x1(:).*x1(:));
    %x1
    %sum(x1(:).*x1(:))
    
tx1 = reshape(c1(1,1,:), 1,size(c1,3));
ty1 = reshape(c1(1,2,:), 1,size(c1,3));
tz1 = reshape(c1(1,3,:), 1,size(c1,3));
%rx1 = reshape(c1(1,4,:), 1,size(c1,3));
%ry1 = reshape(c1(1,5,:), 1,size(c1,3));
%rz1 = reshape(c1(1,6,:), 1,size(c1,3));
     
tx2 = reshape(c2(1,1,:), 1,size(c2,3));
ty2 = reshape(c2(1,2,:), 1,size(c2,3));
tz2 = reshape(c2(1,3,:), 1,size(c2,3));
%rx2 = reshape(c2(1,4,:), 1,size(c2,3));
%ry2 = reshape(c2(1,5,:), 1,size(c2,3));
%rz2 = reshape(c2(1,6,:), 1,size(c2,3));
    
dist = dtw(tx1, tx2, size(c1,3)) ...
           + dtw(ty1, ty2, size(c1,3)) ...
           + dtw(tz1, tz2, size(c1,3)); %...
           %dtw(rx1, rx2, size(c1,3)) ...
           %dtw(ry2, ry2, size(c1,3)) ...
           %dtw(rz1, rz2, size(c1,3))]);
    
    
end

