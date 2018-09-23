%func_for_ode.m - function x(t) for ode45
function dxdt = func_for_ode(t, x)
dxdt = -0.5.*x + input_impact(t);
end

