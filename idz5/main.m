clc; clear; close all;

global A B X_START X_END t_switch
X_START = [1 0];
X_END = [0 0]; 
A = [-2 0.5; 0 -1];
B = [0 1];

% 1. Alalytical solution
t_end = -log((-2+32^0.5)/14);                   % 1.3425
t_switch = log(0.5 + 0.5*(-2+32^0.5)/14)+t_end; % 0.8814
t = 0 : 0.01 : t_end;
x1 = exp(-2.*t) ...
     - 0.5.*(0.5 + 0.5.*exp(-2*t) - 1*exp(-t)) ...
     + 0.5.*(2*Heaviside(t, t_switch)).*(0.5 + 0.5.*exp(-2*(t-t_switch)) - 1*exp(-(t-t_switch)));
x2 = -1 + 2.*Heaviside(t, t_switch) + exp(-t) - 2.*Heaviside(t, t_switch).*exp(-(t-t_switch));
figure;
plot(t, x1, t, x2)
grid on; xlabel('t'); ylabel('x1(t), x2(t)'); 
title('Analytical solution x1(t), x2(t)'); legend('x1(t)', 'x2(t)')
fprintf('1. Alalytical solution: t_switch = %f, t_end = %f\n', t_switch, t_end)

% 2. Graphic solution
figure; hold on; grid on; axis([-0.2 +1 -1 0]); 
title('Graphic solution x2(x1)'); xlabel('x1'); ylabel('x2(x1)');
opt = odeset('AbsTol', 1e-9, 'RelTol', 1e-9);

[t_inverse, x_inverse] = ode45('inverse_ode_fun', [0 0.5], X_END, opt);
plot(x_inverse(:, 1), x_inverse(:, 2), 'rx-')

[t_direct, x_direct] = ode45('direct_ode_fun', [0 1], X_START, opt);
plot(x_direct(:, 1), x_direct(:, 2), 'bx-')

t_switch2 = find_switch_time(t_direct, x_direct, t_inverse, x_inverse);

t_switch = t_switch2;
opt = odeset('AbsTol', 1e-7);
[t, x] = ode45('switch_method_ode_fun', [0 2], X_START, opt);
figure; hold on; grid on; 
title('Graphic solution x1(t), x2(t)'); xlabel('t'); ylabel('x1(t), x2(t)');
plot(t, x)

t_end2 = 0;
for i = 1:length(t)
    if x(i, 1) < 0
        t_end2 = t(i);
        break;
    end
end

fprintf('2. Graphic solution: t_switch = %f, t_end = %f\n', t_switch2, t_end2)

% 3. Fminsearch solution
figure
x0 = [1 1];
times = fminsearch('switch_method_fminsearch_fun', x0);
fprintf('3. Fminsearch solution: t_switch = %f, t_end = %f\n', times(1), times(2))
grid on; legend('x1', 'x2')


