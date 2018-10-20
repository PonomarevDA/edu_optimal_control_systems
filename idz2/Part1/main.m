%file idz2_part1.m - main
clear; close all; clc;

% Analytical calculation
% figure
% [x, y] = meshgrid(-5 : 0.02 : 2);
% f = exp(-0.1.*(x.^2+y.^2+4.*x-2.*y+5)).*cos(x.^2+y.^2+4.*x-2.*y+5);
% plot3(x, y, f)
% figure
% z = -4 : 0.1 : 8;
% plot(z, exp(-0.1.*z).*cos(z), 0, 1, 'x')
% grid on

% Numerical calculation
x0 = [-1 1];
f_global_maximum_arguments = fminsearch('calculate_f', x0)
f_global_maximum_value = -calculate_f(f_global_maximum_arguments)