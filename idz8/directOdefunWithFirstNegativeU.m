function dxdt = directOdefunWithFirstNegativeU(t, x)
global t1 t2 t3 t_end
d = 0.25; w = 0.7;
if t < t1
    u = -1;
elseif t < t2
    u = +1;
elseif t < t3
    u = -1;
elseif t < t_end
    u = +1;
else
    u = 0;
end
dxdt = [x(2);
        -(d^2 + w^2)*x(1) - 2*d*x(2) + u];
end

