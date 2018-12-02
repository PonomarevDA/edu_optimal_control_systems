clc; clear; close all;

% Init data:
global A B t1 t2 t T x x_start x_end
x_start = [0 0 10];
x_end = [0 0 0];
t0 = 0;
t1 = 4.7;
t2 = 8.3;
T = 9;

% Calculate parameters
V0 = 6.17;          L = 39;         r21 = -0.69;	r31 = 6.14;     q21 = 1.22;
q31 = -3.12;        s21 = -0.44;    s31 = -3.1;     W = V0/L;       a11 = -r31*W;
a12 = -q31*W^2;     a21 = -r21;     a22 = -q21*W;   b11 = -s31*W^2; b21 = -s21*W;
A = [a11	a12     0;	% углова€ скорость рыскань€ омега_у
     a21	a22     0;	% угол дрейфа бетта
     1      0       0]; % угол рыскань€ фи
B = [b11; b21; 0];      % коэффицинты перед управл€ющим воздействием

% Part 1. Determine the initial combination of switching points
figure; hold on; grid on;
[t_inverse, x_inverse] = ode45('odefun_with_negative_u', [t0 1], x_end);
[t, x] = ode45('odefun', [t0 T], x_start);

subplot(3, 1, 2), plot(x(:,2), x(:,1)); title('‘азова€ плоскость x1(x2)')
hold on; plot(x_inverse(:,2), x_inverse(:,1));
subplot(3, 1, 1), plot(t, x, 'b'); title('ѕереходные процессы x1(t), x2(t), x3(t)')
subplot(3, 1, 3), plot(t, calculate_u(t), 'b'); title('”правл€ющее воздействие u(t)')

fprintf("Initial combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Initial end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));

% Part 2. Specify the combination of switching points
figure; grid on;
[Time, fval] = fminsearch('fmsfun', [t1 t2 T]);
fprintf("Specify combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Specify end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));
fprintf("Transition time = %f\n\n", calculate_transition_time(t, x));