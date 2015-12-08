figure
hold on

plot(theta.tx)
plot(theta.ty)
plot(theta.tz)
plot(theta.rx)
plot(theta.ry)
plot(theta.rz)

title('Theta without clustering', 'FontSize', 14)
xlabel('time','FontSize', 14)
ylabel('theta value','FontSize', 14)

legend('tx', 'ty', 'tz', 'rx', 'ry', 'rz');