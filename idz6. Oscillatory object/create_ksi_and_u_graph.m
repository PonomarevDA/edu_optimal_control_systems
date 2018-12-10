function create_ksi_and_u_graph()
clear; clc; close all;
t_end = 15; d = 0.25; w = 0.7;
odefun = @(t, x) [x(2)*(d^2+w^2); -x(1)+x(2)*2*d];

figure
ksi0 = [0.1 0.1];
[t, x] = ode45(odefun, [0 t_end], ksi0);
plot(t, x(:, 2))
hold on; grid on;

u = zeros(length(t), 1);
for i = 1:length(t)
    if x(i, 2) > 0
        u(i) = 1;
    else
        u(i) = -1;
    end
end
plot(t, u(:, 1))
end

