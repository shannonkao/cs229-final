function [positions] = exportAbsoluteTranslations(theta, joints, cluster)
    for i = 1:max(cluster)
        if (size(theta(i).tx,1) > 0) ...
            && (sum(isnan(theta(i).tx) + isnan(theta(i).ty) + isnan(theta(i).tz)) == 0)
           positions(:,i,1) = theta(i).tx*joints(cluster(i)).abs_pos(1);
           positions(:,i,2) = theta(i).ty*joints(cluster(i)).abs_pos(2);
           positions(:,i,3) = theta(i).tz*joints(cluster(i)).abs_pos(3);
        else
           positions(:,i,1) = joints(cluster(i)).abs_pos(1)*ones(size(theta(1).tx));
           positions(:,i,2) = joints(cluster(i)).abs_pos(2)*ones(size(theta(1).ty));
           positions(:,i,3) = joints(cluster(i)).abs_pos(3)*ones(size(theta(1).tz)); 
        end
    end
    
    posX=dataset(positions(:,:,1));
    export(posX, 'WriteVarNames', true);
    posY=dataset(positions(:,:,2));
    export(posY, 'WriteVarNames', true);
    posZ=dataset(positions(:,:,3));
    export(posZ, 'WriteVarNames', true);
end