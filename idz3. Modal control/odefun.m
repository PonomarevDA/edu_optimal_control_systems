function dxdt = odefun(t, x)
%@brief ode45 function
%@param t - time vector with size(pointsAmount, 1)
%@param x - state variables values with size(pointsAmount, stateVariablesAmount)
global A B
dxdt = zeros(3, 1);
dxdt(1) = A(1,1)*x(1) + A(1,2)*x(2) + A(1,3)*x(3) + B(1)*control_impact(x'); 
dxdt(2) = A(2,1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3) + B(2)*control_impact(x'); 
dxdt(3) = A(3,1)*x(1) + A(3,2)*x(2) + A(3,3)*x(3) + B(3)*control_impact(x'); 
end

