%file idz2_part1.m - main
clear; close all; clc;
calculate_z = @(x,y) x.^2 + y.^2 + 4.*x - 2.*y + 5;
calculate_f = @(x,y) 1.*exp(-0.1.*calculate_z(x,y)).*cos(calculate_z(x,y));
fminsearch_function = @(args) -calculate_f(args(1), args(2));

% Find maximum
x0 = [-2 1];
f_global_maximum_arguments = fminsearch(fminsearch_function, x0)
f_global_maximum_value = -fminsearch_function(f_global_maximum_arguments)

% Create graph
figure
[x, y] = meshgrid(-5 : 0.02 : 2);
plot3(x, y, calculate_f(x,y))
grid on; xlabel('x', 'FontSize', 20); ylabel('y', 'FontSize', 20); zlabel('f(x,y)', 'FontSize', 20)
figure
z = -4 : 0.1 : 8;
plot(z, exp(-0.1.*z).*cos(z), 0, 1, 'x'); xlabel('z', 'FontSize', 20); ylabel('f(z)', 'FontSize', 20);
grid on
figure
contour(x, y, calculate_f(x,y)); xlabel('x', 'FontSize', 20); ylabel('y', 'FontSize', 20);