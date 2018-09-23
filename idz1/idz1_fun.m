function dxdt = idz1_fun(t, x)
A = [0 1 0; 1 0 2; -3 -4 -2];
dxdt = [A(1, 1)*x(1) + A(1,2)*x(2) + A(1,3)*x(3);...
        A(2, 1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3);...
        A(3, 1)*x(1) + A(3,2)*x(2) + A(3,3)*x(3)];
end

