figure

subplot(2,3,1)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).t_xyz(1,:), 'b');
    end
end
hold off
title('X Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,2)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).t_xyz(2,:), 'b');
    end
end
hold off
title('Y Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,3)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).t_xyz(3,:), 'b');
    end
end
hold off
title('Z Translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,4)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).R_xyz(1,:), 'b');
    end
end
hold off
title('X Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,5)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).R_xyz(2,:), 'b');
    end
end
hold off
title('Y Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)

subplot(2,3,6)
hold on
for i = 1:length(skel)
    if size(skel(i).R_xyz,1) > 0
        plot(skel(i).R_xyz(3,:), 'b');
    end
end
hold off
title('Z Rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
axis tight
%ylabel('theta value','FontSize', 14)