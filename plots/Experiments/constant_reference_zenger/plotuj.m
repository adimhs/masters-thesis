clear all

a = load('LOG-9771.TXT');

dt = 0.033;

from = 25/dt;
% to = from + 30/dt;
to = size(a, 1)-3/dt;

mpcEnabled = 1;

speedLimit = 0.35;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
hold off
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -0.7 0.7]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Setpoint', 'Position from KF');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625/2])

drawnow;

pause(2);

tightfig(hFig);

std = std(a(from:to, 1))
max = max(abs(a(from:to, 1)))