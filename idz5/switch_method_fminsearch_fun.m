function error = switch_method_fminsearch_fun(time_points)
global t_switch X_START X_END
t_switch = time_points(1);
t_end = time_points(2);
opt = odeset('AbsTol', 1e-7);
[t, x] = ode45('switch_method_ode_fun', [0 t_end], X_START, opt);
error = (x(end, 1) - X_END(1))^ 2 + (x(end, 2) - X_END(2))^ 2;
plot(t, x)
pause(0.1)
end

