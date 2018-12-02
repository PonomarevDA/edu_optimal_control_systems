function u = control_impact(x)
%@brief Calculate control impact u = -K1*x1 - K2*x2
%@param x - state variables with size (pointsAmount, stateVariablesAmount)
%@return control impact with size(pointsAmount, 1)
%@note u <= |Umax|
global K
Umax = 1;
u = -K(1).*x(3) - K(2).*x(1);
if u > Umax
	u = Umax;
elseif u < -Umax
	u = -Umax;
end
end
