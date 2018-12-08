function auxiliary_task()
global t0 t1 t2 t T x x_start x_end x3f

figure; hold on; grid on;
[t_inverse, x_inverse] = ode45('odefun_with_negative_u', [t0 1], x_end);
[t, x] = ode23s('odefun', [t0 T], x_start);

subplot(3, 1, 2), plot(x(:,2), x(:,1)); title('‘азова€ плоскость x1(x2)')
hold on; plot(x_inverse(:,2), x_inverse(:,1));
subplot(3, 1, 1), plot(t, x); title('ѕереходные процессы x1(t), x2(t), x3(t)')
subplot(3, 1, 3), plot(t, calculate_u(t), 'b'); title('”правл€ющее воздействие u(t)')

fprintf("Initial combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Initial end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));
x3f = x(end,3);
end

