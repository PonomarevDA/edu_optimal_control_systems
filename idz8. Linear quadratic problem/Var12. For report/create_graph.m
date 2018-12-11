clc; clear; close all

% Инициализация первого метода
calculate_u1 = @(t) -3.9454*exp(-t*1.6503) +3.0867*exp(-t*1.5088); 
odefun1 = @(t, x) [-2*x(1) + x(2); -2*x(2) + calculate_u1(t)];

% Инициализация второго метода
K1 = 0.8; K2 = 0.16;
calculate_u2 = @(x) -K1.*x(1,:) - K2.*x(2,:); 
odefun2 = @(t, x) [-2*x(1) + x(2); -2*x(2) + calculate_u2(x)];

% Расчет и построение графиков
[t1, x1] = ode45(odefun1, [0 5], [1 0]);
[t2, x2] = ode45(odefun2, [0 5], [1 0]);
subplot(2, 1, 1); plot(t1, calculate_u1(t1), t2, calculate_u2(x2'))
grid on; title('Переходный процесс u(t)')
subplot(2, 1, 2); plot(t1, x1, t2, x2); 
grid on; title('Переходный процесс х1(t), x2(t)')