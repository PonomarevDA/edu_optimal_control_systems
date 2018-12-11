function J = fms(k)
global K1 K2
k
K1 = k(1); K2 = k(2);
calculate_u = @(t, x) - K1*x(1) - K2*x(2);
odefun = @(t, x) [-2*x(1) + x(2); -x(2) + calculate_u(t, x)];

[t, x] = ode45(odefun, [0 10], [1 0]);

u = zeros(length(t), 1);
for i = 1:length(t)
    u(i) = calculate_u(t(i), x(i,:));
end
plot(t, u)

Sx1 = 0;
Su = 0;
for i = 2:length(t)
    dt = t(i) - t(i-1);
    
    dx1 = abs(x(i, 1) + x(i-1, 1))/2;
    Sx1 = Sx1 + dx1*dt;
    
    du = abs(u(i) + u(i-1)) / 2;
    Su = Su + du*dt;
end
J = 2.2*Sx1^2 + Su^2;
end