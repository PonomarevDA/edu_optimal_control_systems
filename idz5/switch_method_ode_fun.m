function dxdt = switch_method_ode_fun(t, x)
global A B
u = calculate_u(t);
dxdt = [A(1,1)*x(1) + A(1,2)*x(2) + B(1)*u; ...
        A(2,1)*x(1) + A(2,2)*x(2) + B(2)*u];
end

