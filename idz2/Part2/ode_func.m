function dxdt = ode_func(t, x)
dxdt = -0.5.*x + input_impact(t);
end

