% Init data
clear; close all; clc;
global t_start t_top t_end x0 U
x0 = 10;    % x(0)
t_start = 0;     % the begin of heviside
t_top = 3.5;	% the top of heviside
t_end = 9;     % the end of heviside
U = 2;      % heviside amplitude

% Numerical sulution - find Um
Um = fminsearch('fminsearch_func', 0);
fprintf('Um = %f \n', Um);

% Analytical solution - Um perfect
t = t_start : 0.1 : t_end;
hold on; grid on;
plot(t, analytical_func(t), 'rx', ...
     t_start, x0, ...
     t_end, 0)
title('Numberical and Analytical solutions')
xlabel('t, sec'); ylabel('x(t)');
legend('analytical solution', 'ode45 solution', 'start point', 'end point')

% Create heviside graph
figure;
plot(t, input_impact(t), ...  % input_impact u(t)
    0, 0, 'x', ...            % u(t_start) = 0
    t_top, U, 'x', ...        % u(t_top) = Um
    t_end, 0, 'x')            % u(t_end) = 0
grid on;
title('Input impact u(t)')
legend('input_impact u(t)', 'u(t_start) = 0', 'u(t_top) = Um', 'u(t_end) = 0')