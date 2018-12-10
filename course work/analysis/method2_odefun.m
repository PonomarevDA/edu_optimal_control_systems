function dxdt = method2_odefun(t, x)
global A B

rudderAngleMax = 35;
if x(4) > rudderAngleMax
    x(4) = rudderAngleMax;
elseif x(4) < -rudderAngleMax
	x(4) = -rudderAngleMax;
end

dxdt = [A(1,1)*x(1) + A(1,2)*x(2) + A(1,3)*x(3) + A(1,4)*x(4); ...
        A(2,1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3) + A(2,4)*x(4); ...
        A(3,1)*x(1) + A(3,2)*x(2) + A(3,3)*x(3) + A(3,4)*x(4);
        method2_control_impact(x)];
end

