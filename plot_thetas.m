figure
hold on
for i = 1:length(theta)
    plot(theta(i).tx);
end

title('Theta for x translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    plot(theta(i).ty);
end

title('Theta for y translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    plot(theta(i).tz);
end

title('Theta for z translation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    plot(theta(i).rx);
end

title('Theta for x rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    plot(theta(i).ry);
end

title('Theta for y rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

figure
hold on
for i = 1:length(theta)
    plot(theta(i).rz);
end

title('Theta for z rotation', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)