clc; clear; close all;

global A B X_START X_END TIME_END
X_START = [1 0];
X_END = [0 0]; 
TIME_END = 2;
A = [-2 0.5; 0 -1];
B = [0 1];

figure; hold on; grid on; axis([-0.2 +1 -1 0])
[t, x_inverse] = ode45('inverse_ode_fun', [0 0.5], X_END);
plot(x_inverse(:, 1), x_inverse(:, 2), 'rx-')
[t, x_direct] = ode45('direct_ode_fun', [0 1], X_START);
plot(x_direct(:, 1), x_direct(:, 2), 'bx-')

t_switch = t(1);
error_min = (x_inverse(length(t),1) - x_direct(1,1))^2 + (x_inverse(length(t),2) - x_direct(1,2))^2;
for i = 2:length(t)
    error = (x_inverse(length(t)-i+1,1) - x_direct(i,1))^2 + (x_inverse(length(t)-i+1,2) - x_direct(i,2))^2;
    if error < error_min
        error_min = error;
        t_switch = t(i);
    end
end
t_switch
error_min


ksi0 = [1 1];
figure
%opt = optimset('TolFun', 1e-8)
fminsearch('switch_method_fminsearch_fun', ksi0)
grid on; legend('x1', 'x2')