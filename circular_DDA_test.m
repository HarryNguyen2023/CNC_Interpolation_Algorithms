clc; clear;
% Get the coordinate from the DDA interpolation
R = 80;
arc_coord = circular_sequential_DDA(R, [0 R], [R 0]);
plot(arc_coord(:,1), arc_coord(:,2))
hold on
% Plot the origin curve
deg = linspace(0,pi/2,50);
xunit = R * cos(deg);
yunit = R * sin(deg);
plot(xunit, yunit, '--')
% Add plot specifications
xlabel('X (BLU)')
ylabel('Y (BLU)')
title('DDA CIRCULAR SEQUENTIAL INTERPOLATION');
legend('Interpolated','Target')
hold off