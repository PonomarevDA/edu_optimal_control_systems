% idz2_part2.m - main file of task 2

% Init data
clear; close all; clc;
global t0, global t1, global t2, global x0, global U
x0 = 10;    % x(0)
t0 = 0;     % the begin of heviside
t1 = 3.5;	% the top of heviside
t2 = 9;     % the end of heviside
T = t2 + 1; % the end of graph
U = 2;      % heviside amplitude

% Create heviside graph
figure;
plot(-1:0.1:T, input_impact(-1:0.1:T), ...  % input_impact u(t)
    0, 0, 'x', ...                          % u(0) = 0
    t1, U, 'x', ...                         % u(t1) = Um
    t2, 0, 'x')                             % u(t2) = 0
grid on;
title('Input impact u(t)')
legend('input_impact u(t)', 'u(0) = 0', 'u(t1) = Um', 'u(t2) = 0')

% Find Um
U = fminsearch('analytical_func_for_fminsearch', x0)

% Ode graph (Um perfect)
figure;
[t, x] = ode45('func_for_ode', [0 T], x0);
plot(t, x, 'b', ...     % ode45 graph
    t2, t0, 'o', ...	% target point
    t0, x0, 'o');       % initial condition point
grid on;
hold on;

% Analytical graph (Um perfect)
plot(t, analytical_func(t), 'rx')
title('Ode45 and Analytical solutions')
xlabel('t, sec')
ylabel('x(t)')
legend('ode45 solution', 'target point', 'initial condition point', 'analytical solution')

% Analytical x(t) with diffrent value of U
figure;
hold on; grid on;
U = 2; plot(t, analytical_func(t));
U = 1; plot(t, analytical_func(t));
U = 0; plot(t, analytical_func(t));
U = -1; plot(t, analytical_func(t));
U = -2; plot(t, analytical_func(t));
plot(t2, t0, 'o', ...	% target point
    t0, x0, 'o');       % initial condition point
title('Analytical x(t) with different value of U')
legend('U = 2', 'U = 1', 'U = 0', 'U = -1', 'U = -2', 'target point', 'initial condition point')