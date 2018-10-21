function dxdt = inverse_ode_fun(t, x)
global A B
u = +1;
dxdt = -[A(1,1)*x(1) + A(1,2)*x(2) + B(1)*u; ...
        A(2,1)*x(1) + A(2,2)*x(2) + B(2)*u];
end