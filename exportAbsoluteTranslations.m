function [positions] = exportAbsoluteTranslations(theta, joints, cluster)

j = 1;

for i = 1:max(cluster)
    
    if cluster(j) == 0
        position(:,i,1) = zeros(size(theta(1).rx,2),1);
        position(:,i,2) = zeros(size(theta(1).rx,2),1);
        position(:,i,3) = zeros(size(theta(1).rx,2),1);
        j = j+1;
        continue;
    end
    
    data = joints(cluster(j));
    
    % multiple joints in same cluster
    for k = 1:size(data,1)
        l = i+k-1;
        Input(1) = data(k).abs_pos(1);
        Input(2) = data(k).abs_pos(2);
        Input(3) = data(k).abs_pos(3);
        Input(4) = data(k).nestdepth;
        Input(5) = data(k).num_children;
        Input(6) = data(k).offsetFromParent(1);
        Input(7) = data(k).offsetFromParent(2);
        Input(8) = data(k).offsetFromParent(3);

        if (size(theta(i).rx,1) > 0)% ...
           % && (sum(isnan(theta(i).rx) + isnan(theta(i).ry) + isnan(theta(i).rz)) == 0)
           positions(:,l,1) = theta(i).tx'*Input';
           positions(:,l,2) = theta(i).ty'*Input';
           positions(:,l,3) = theta(i).tz'*Input';
           positions(:,l,4) = theta(i).rx'*Input';
           positions(:,l,5) = theta(i).ry'*Input';
           positions(:,l,6) = theta(i).rz'*Input';
        else
%            positions(:,l,1) = joints(cluster(j)).abs_pos(1)*ones(size(theta(1).rx,2),1);
%            positions(:,l,2) = joints(cluster(j)).abs_pos(2)*ones(size(theta(1).ry,2),1);
%            positions(:,l,3) = joints(cluster(j)).abs_pos(3)*ones(size(theta(1).rz,2),1);
            position(:,l,1) = zeros(size(theta(1).rx,2),1);
            position(:,l,2) = zeros(size(theta(1).rx,2),1);
            position(:,l,3) = zeros(size(theta(1).rx,2),1);
            position(:,l,4) = zeros(size(theta(1).rx,2),1);
            position(:,l,5) = zeros(size(theta(1).rx,2),1);
            position(:,l,6) = zeros(size(theta(1).rx,2),1);
        end
    
    end
    j = j+1;
end

figure

subplot(2,3,1)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,1)', 'b');
end
hold off
title('X Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,2)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,2)', 'b');
end
hold off
title('Y Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,3)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,3)', 'b');
end
hold off
title('Z Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)
subplot(2,3,4)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,4)', 'b');
end
hold off
title('X Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,5)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,5)', 'b');
end
hold off
title('Y Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,6)
hold on
for i = 1:size(positions,2)
    plot(positions(:,i,6)', 'b');
end
hold off
title('Z Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight

posX=dataset(positions(:,:,1));
export(posX, 'WriteVarNames', true);
posY=dataset(positions(:,:,2));
export(posY, 'WriteVarNames', true);
posZ=dataset(positions(:,:,3));
export(posZ, 'WriteVarNames', true);

end