clc; clear; close all;

% Init data:
global t1 t2 T x x_start x_end
x_start = [10 0 0];
x_end = [0 0 0];
t0 = 0;
t1 = 50;
t2 = 50.6143;
T = 50.79;

% Part 1. Determine the initial combination of switching points
figure; hold on; grid on;
inverse_odefun_with_negative_u = @(t, x) -[x(2); x(3); -6*x(2)-5*x(3) - 1.2];
[t_inverse, x_inverse] = ode45(inverse_odefun_with_negative_u, [t0 0.2], x_end);
[t, x] = ode45('odefun', [t0 T], x_start);

subplot(3, 1, 2), plot(x(:,2), x(:,3)); title('‘азова€ плоскость x3(x2)')
hold on; plot(x_inverse(:,2), x_inverse(:,3));
subplot(3, 1, 1), plot(t, x, 'b'); title('ѕереходные процессы x1(t), x2(t), x3(t)')
subplot(3, 1, 3), plot(t, calculate_u(t), 'b'); title('”правл€ющее воздействие u(t)')

fprintf("Initial combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Initial end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));

% Part 2. Specify the combination of switching points
figure; grid on;
[Time, fval] = fminsearch('fmsfun', [t1 t2 T]);
fprintf("Specify combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Specify end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));
