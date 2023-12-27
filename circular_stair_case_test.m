clc, clear;
% Get the coordinate from the DDA interpolation
R = 80;
[X_coord, Y_coord] = circular_stair_case(R, [0 R], [R 0]);
plot(X_coord, Y_coord)
hold on
% Plot the origin curve
deg = linspace(0,pi/2,50);
xunit = R * cos(deg);
yunit = R * sin(deg);
plot(xunit, yunit, '--')
% Add plot specifications
xlabel('X (BLU)')
ylabel('Y (BLU)')
title('STAIR CASE CIRCULAR INTERPOLATION');
legend('Interpolated','Target')
hold off