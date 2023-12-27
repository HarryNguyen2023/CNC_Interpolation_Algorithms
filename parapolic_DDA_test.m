clc; clear;
% Initiate parameters
start = [0 0];
stop = [24 36];
focal_len = 4;
register_bit_size = 4;
% Get the wave point of the interpolation 
para_coord = parabolic_DDA(start, stop, focal_len, register_bit_size);
plot(para_coord(:,1), para_coord(:,2))
hold on
% Plot the original parabolic
x = linspace(0,25,50);
y = (x.^2)/(4*focal_len);
plot(x,y,'--')
xlabel("X (BLU");
ylabel("Y (BLU)");
title("DDA PARABOLIC INTERPOLATION");
legend('Interpolated','Target')
hold off

