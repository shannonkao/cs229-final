function [ dist ] = xcorrDist( c1, c2 )

tx1 = reshape(c1(1,1,:), 1,size(c1,3));
ty1 = reshape(c1(1,2,:), 1,size(c1,3));
tz1 = reshape(c1(1,3,:), 1,size(c1,3));
rx1 = reshape(c1(1,4,:), 1,size(c1,3));
ry1 = reshape(c1(1,5,:), 1,size(c1,3));
rz1 = reshape(c1(1,6,:), 1,size(c1,3));
     
tx2 = reshape(c2(1,1,:), 1,size(c2,3));
ty2 = reshape(c2(1,2,:), 1,size(c2,3));
tz2 = reshape(c2(1,3,:), 1,size(c2,3));
rx2 = reshape(c2(1,4,:), 1,size(c2,3));
ry2 = reshape(c2(1,5,:), 1,size(c2,3));
rz2 = reshape(c2(1,6,:), 1,size(c2,3));
    
dist = norm([max(xcorr(tx1, tx2)) ...
           max(xcorr(ty1, ty2)) ...
           max(xcorr(tz1, tz2)) ...
           max(xcorr(rx1, rx2)) ...
           max(xcorr(ry2, ry2)) ...
           max(xcorr(rz1, rz2))]);

end