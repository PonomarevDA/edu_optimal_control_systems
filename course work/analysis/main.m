clc; clear; close all;

V0_percent = 100; L_percent = 100;

% Method 1.
global t1 t2 t3
t1 = 4.917494;
t2 = 8.609763;
t3 = 9.257274;
% Method 2.
global K
K = [1.3662, 11.2614];
% Method 3
% global w K
% w = 0.3572;
% K = [4.178531, -0.001744, 0.797138, 0.264214];


% Method 1.
% method1_init_system(V0_percent, L_percent)
% [t, x] = ode23s('method1_odefun', [0, 12], [0 0 10]);
% plot(t, x), grid on
% Method 2.
method2_init_system(130, L_percent)
[t, x] = ode23s('method2_odefun', [0, 40], [0 0 10 0]);
plot(t, x(:,1:3)), grid on
% Method 3
% method2_init_system(130, L_percent) % 2 и 3 методы одинаковы: 4-ый порядок
% [t, x] = ode23s('method3_odefun', [0, 40], [0 0 10 0]);
% plot(t, x(:,1:3)), grid on
% 
% Общее: расчет времени ПХ и подписывание осей
calculate_transition_time(t, x(:,1:3))
title('Переходный процесс фи(t), w(t), B(t)')
xlabel('t, сек');
ylabel('фи(t), w(t), B(t)')
