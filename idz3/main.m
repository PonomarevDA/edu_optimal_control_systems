clear; close all; clc;
% 3. Модальное управление
% По каждому варианту необходимо найти значение базовой частоты заданного 
% типа полинома, обеспечивающее минимальное время переходных процессов в 
% замкнутой системе управления и построить графики переходных процессов по 
% состояниям объекта управления и управляющему воздействию.
% Для всех вариантов максимально допустимое значение управляющего 
% воздействие принимается равным 1 и вектор начальных условий [1 0 0]

global A B POLY_TYPE SYSTEM_DEGREE x0
% Input variant12 data 
SYSTEM_DEGREE = 3;
A = [-1 1 0; 0 -2 2; 0 0 1];
B = [0 0 1];
POLY_TYPE = 4;
x0 = [1 0 0];

% Input example data 
% SYSTEM_DEGREE = 3;
% A = [0 1 0; 0 -2 2; 0 0 -1];
% B = [0 0 1];
% POLY_TYPE = 1;
% x0 = [1 0 0];

% Find transition time 'time' and base frequency 'w' and create state
% variables graph
w0 = 2;
tic
[w,time] = fminsearch('fminsearch_function', w0)
toc 

figure
%K = calculate_control_impact_coefficients(w)
[t, x] = ode45('odefun', [0 5], x0);
u = control_impact(x);
plot(t, u)
grid on; legend('u'); xlabel('t'); ylabel('u(t)');

toc

figure
plot(t, x)
grid on; legend('x1', 'x2', 'x3'); xlabel('t'); ylabel('x(t)');
