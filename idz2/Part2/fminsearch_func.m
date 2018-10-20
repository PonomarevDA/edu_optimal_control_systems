function f = fminsearch_func(U_new)
% func_for_fminsearch(U) return abs( f(U, t = 9) )
% So, it should be used in fminsearch() function
global t_start t_end U x0
U = U_new;
[t, x] = ode45('ode_func', [t_start t_end], x0);
plot(t, x)
pause(0.01);
f = abs(x(end));
end

