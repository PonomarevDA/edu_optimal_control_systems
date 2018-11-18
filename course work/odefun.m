function dxdt = odefun(t, x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global A B
dxdt = [A(1,1)*x(1) + A(1,2)*x(2) + A(1,3)*x(3) + B(1)*control_impact(x); ...
        A(2,1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3) + B(2)*control_impact(x); ...
        A(2,1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3) + B(2)*control_impact(x)];
end

