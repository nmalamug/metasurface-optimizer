function plotFarfield(farfield, tle)
%PLOTFARFIELD Summary of this function goes here
%   Detailed explanation goes here
E2 = squeeze(farfield.E2);
figure

hold on
plot(asin(farfield.ux)*180/pi, E2(:,101,1), 'r')
plot(asin(farfield.ux)*180/pi, E2(:,101,3), 'g')
plot(asin(farfield.ux)*180/pi, E2(:,101,5), 'b')
legend('1640 nm','1575 nm', '1510 nm')
title(tle)
hold off
end

