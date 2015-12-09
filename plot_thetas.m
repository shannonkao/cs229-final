figure
hold on
for i = 1:length(theta)
    if size(theta(i).tx,1) > 0
        plot(theta(i).tx(1,:));
    end
end

title('Theta for x translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    if size(theta(i).ty,1) > 0
        plot(theta(i).ty(1,:));
    end
end

title('Theta for y translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    if size(theta(i).tz,1) > 0
        plot(theta(i).tz(1,:));
    end
end

title('Theta for z translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    if size(theta(i).rx,1) > 0
        plot(theta(i).rx(1,:));
    end
end

title('Theta for x rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    if size(theta(i).ry,1) > 0
        plot(theta(i).ry(1,:));
    end
end

title('Theta for y rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    if size(theta(i).rz,1) > 0
        plot(theta(i).rz(1,:));
    end
end

title('Theta for z rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)