clear; close all; clc;
% 3. Модальное управление
% По каждому варианту необходимо найти значение базовой частоты заданного 
% типа полинома, обеспечивающее минимальное время переходных процессов в 
% замкнутой системе управления и построить графики переходных процессов по 
% состояниям объекта управления и управляющему воздействию.
% Для всех вариантов максимально допустимое значение управляющего 
% воздействие принимается равным 1 и вектор начальных условий [1 0 0]

% 1. Input variant12 data 
global A B x0
A = [-1 1 0; 0 -2 2; 0 0 1];
B = [0 0 1];
x0 = [1 0 0];

% 2. Find transition time 'time' and base frequency 'w' and create state
% variables graph
w0 = 2;
[w,time] = fminsearch('fminsearch_function', w0)

% 3. Create graph u(t)
figure
[t, x] = ode45('odefun', [0 5], x0);
u = control_impact(x);
plot(t, u)
grid on; legend('u'); xlabel('t'); ylabel('u(t)');

% 4. Create graph x(t)
figure
plot(t, x)
grid on; legend('x1', 'x2', 'x3'); xlabel('t'); ylabel('x(t)');
