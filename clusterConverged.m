function [ output ] = clusterConverged( oldcentroids, newcentroids )
max_diff = 0;
for i = 1:size(oldcentroids,1)
    for j = 1:size(oldcentroids,2)
        diff = abs(oldcentroids(i,j) - newcentroids(i,j));
        if diff > max_diff
            max_diff = diff;
        end
    end
end

if max_diff > 0.01
    output = false;
else
    output = true;

end

