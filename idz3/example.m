%example, check, test...
clc; clear; close all;

% Input data
w0 = 0;

%Analytical
A1 = [0 0 1; 0 2 3; 2 2 2];
a = get_poly_coefficients(3, 4);
B1 = [a(3)*w0 - 2; a(2)*w0^2 + 1; a(1)*w0^3+2];
% A1 = [0 0 1; 0 2 2; 2 0 0];
% a = get_poly_coefficients(3, 1);
% B1 = [3*w0 - 3; 3*w0^2 - 2; w0^3];

k = A1\B1

%Matlab
global A B POLY_TYPE SYSTEM_DEGREE x0
% SYSTEM_DEGREE = 3;
A = [-1 1 0; 0 -2 2; 0 0 1];
B = [0 0 1];
POLY_TYPE = 4;
x0 = [1 0 0];
% SYSTEM_DEGREE = 3;
% A = [0 1 0; 0 -2 2; 0 0 -1];
% B = [0 0 1];
% POLY_TYPE = 1;
% x0 = [1 0 0];

calculate_control_impact_coefficients(w0)