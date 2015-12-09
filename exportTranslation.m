
for i = 1:length(skel)
    positions(:,i, 1) = skel(i).t_xyz(1,:)';
    positions(:,i, 2) = skel(i).t_xyz(2,:)';
    positions(:,i, 3) = skel(i).t_xyz(3,:)';
end


posXt=dataset(positions(:,:,1));
export(posXt, 'WriteVarNames', true);
posYt=dataset(positions(:,:,2));
export(posYt, 'WriteVarNames', true);
posZt=dataset(positions(:,:,3));
export(posZt, 'WriteVarNames', true);