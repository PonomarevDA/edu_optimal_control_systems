clc; clear; close all;

global A B X_START X_END TIME_END
X_START = [1 0];
X_END = [0 0]; 
TIME_END = 2;
A = [-2 0.5; 0 -1];
B = [0 1];

figure; hold on; grid on; axis([-0.2 +1 -1 0])
[t, x] = ode45('direct_ode_fun', [0 TIME_END], X_START);
plot(x(:, 1), x(:, 2))
[t, x] = ode45('inverse_ode_fun', [0 TIME_END], X_END);
plot(x(:, 1), x(:, 2))

%ksi0 = [1 1];
%fminsearch('calculate_error', ksi0)