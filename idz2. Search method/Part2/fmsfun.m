function error = fmsfun(uMax)
global um x0 t2 t x
um = uMax;
opt = odeset('RelTol', 1e-6);
[t,x] = ode45('odefun', [0 t2], x0, opt);
error = x(end)^2;