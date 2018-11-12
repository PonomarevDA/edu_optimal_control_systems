function dxdt = odefun(t, x)
global t1 t2 T
dxdt = [x(2); ...
        x(3); ...
        -6*x(2) - 5*x(3) + 1.2*calculate_u(t)];
end

