clc; clear; close all;

% Init data and functions
N = 40;
d = 0.25; w = 0.7;
period = 2*pi/w;
halfPeriod = period/2;
x0 = [-10 -40];
x_end = [0 0];
inverseOdefunWithNegativeU = @(t, x) -[x(2); -(d^2 + w^2)*x(1) - 2*d*x(2) - 1];
inverseOdefunWithPositiveU  = @(t, x) -[x(2); -(d^2 + w^2)*x(1) - 2*d*x(2) + 1];

% Строим пустой график
figure;
subplot(1, 1, 1); hold on; grid on
title('Фазовая траектория оптимального процесса')

% Фрагмент линий переключения первого порядка
[t, x] = ode23s(inverseOdefunWithNegativeU, [0 halfPeriod], x_end);
plot(x(:, 1), x(:,2), 'gx--')

% Фрагмент линий переключения остальных порядков
secondArr = zeros(20, 2);
thirdArr = zeros(20, 2);
for i = 1:N
	firstLineTimeRange = [0 halfPeriod*i/N];
    otherLineTimeRange = [0 halfPeriod];
	[t, x] = ode23s(inverseOdefunWithNegativeU, firstLineTimeRange, x_end);
        
	[t, x] = ode23s(inverseOdefunWithPositiveU, otherLineTimeRange, [x(end, 1) x(end, 2)]);
	secondArr(i, 1) = x(end, 1);
	secondArr(i, 2) = x(end, 2);
	%plot(x(:, 1), x(:,2), 'b--')
        
	[t, x] = ode23s(inverseOdefunWithNegativeU, otherLineTimeRange, [x(end, 1) x(end, 2)]);
	thirdArr(i, 1) = x(end, 1);
	thirdArr(i, 2) = x(end, 2);
	%plot(x(:, 1), x(:,2), 'r--')
end
plot(secondArr(:, 1), secondArr(:,2), 'b--')
plot(thirdArr(:, 1), thirdArr(:,2), 'r--')

global t1 t2 t3 t_end
t1 = 0.47*halfPeriod;
t2 = t1 + halfPeriod;
t3 = t2 + halfPeriod;
t_end = t3 + 0.2*halfPeriod
[t, x] = ode23s('directOdefunWithFirstPositiveU', [0 t1], x0);
plot(x(:, 1), x(:,2), 'k')
[t, x] = ode23s('directOdefunWithFirstPositiveU', [t1 t2], [x(end, 1), x(end,2)]);
plot(x(:, 1), x(:,2), 'r')
[t, x] = ode23s('directOdefunWithFirstPositiveU', [t2 t3], [x(end, 1), x(end,2)]);
plot(x(:, 1), x(:,2), 'b')
[t, x] = ode23s('directOdefunWithFirstPositiveU', [t3 t_end], [x(end, 1), x(end,2)]);
plot(x(:, 1), x(:,2), 'g')

