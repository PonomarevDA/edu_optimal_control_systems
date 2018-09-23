%file idz2_part1.m - main
clear; close all; clc;
x0 = [0 0];

point_of_minimum_in_z = fminsearch('idz2_part1_z', x0);
value_of_minimum_in_z = idz2_part1_z(point_of_minimum_in_z)

x0 = point_of_minimum_in_z;
point_of_maximum_in_f = fminsearch('idz2_part1_f', x0)
value_of_maximum_in_f = -idz2_part1_f(point_of_maximum_in_f)

z = value_of_minimum_in_z -pi : 0.01 : value_of_minimum_in_z + 2.5*pi;
figure;
plot(z, exp(-0.1.*z).*cos(z), ...
     idz2_part1_z(point_of_maximum_in_f), value_of_maximum_in_f, 'x');
grid on;
legend('f(z)', 'maximum of f(z)')
xlabel('z')
ylabel('f(z)')