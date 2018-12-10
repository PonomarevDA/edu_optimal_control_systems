function J = fms(k)
global K1 K2
k
K1 = k(1); K2 = k(2);
%calculate_u = @(t, x) - K1*x(1) - K2*x(2);
calculate_u = @(t, x) - (exp(-t*(5^(1/2)/10 + 5/2)^(1/2))*(55972337316742414939901996826624*5^(1/2) + 839585059751136224098529952399360))/(112307447139679650679510632938997*5^(1/2) - 6603861951293686653983484018688) - (exp(-t*(5/2 - 5^(1/2)/10)^(1/2))*(28031688165418814654295574219740356090656928563200*5^(1/2) - 802827559372246513645364068078656071765138289459200))/((29391915444156749*5^(1/2) + 914941871198738565)*(112307447139679650679510632938997*5^(1/2) - 6603861951293686653983484018688));
odefun = @(t, x) [-2*x(1) + x(2); -x(2) + calculate_u(t, x)];

[t, x] = ode45(odefun, [0 5], [1 0]);

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