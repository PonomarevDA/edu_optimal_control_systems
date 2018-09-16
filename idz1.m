clear; close all; clc;

% Input data variant12
A = [0 1 0; 1 0 2; -3 -4 -2];
B = [1 0 0];

% Analytical calculated data
delta = [1 2 7 4];
delta1 = [1 2 8];
delta2 = [1 -4];
delta3 = [-3 -4];
T = 4.59;           % время переходного процесса

% Analytical calculate, display data and create plots
figure; grid on; hold on;
disp('First')
idz1_do_alalytical_calculation(delta1, delta)
disp('Second')
idz1_do_alalytical_calculation(delta2, delta)
disp('Third')
idz1_do_alalytical_calculation(delta3, delta)

% Create plot ode45, ode23s
[t, x] = ode23s('idz1_fun', [0 T], B);
plot(t, x, 'o')
[t, x] = ode45('idz1_fun', [0 T], B);
plot(t, x, 'x')

% Create plot Eiler
x1_graph = []; x2_graph = []; x3_graph = []; t_graph = [];
x1 = 1; x2 = 0; x3 = 0; t = 0;
dt = 0.005*T;
while t < 5
    x1_graph = [x1_graph x1];
    x2_graph = [x2_graph x2];
    x3_graph = [x3_graph x3];
    t_graph = [t_graph t];
    dx1 = (A(1, 1)*x1 + A(1,2)*x2 + A(1,3)*x3)*dt;
    dx2 = (A(2, 1)*x1 + A(2,2)*x2 + A(2,3)*x3)*dt;
    dx3 = (A(3, 1)*x1 + A(3,2)*x2 + A(3,3)*x3)*dt;
    x1 = x1 + dx1;
    x2 = x2 + dx2;
    x3 = x3 + dx3;
    t = t + dt;
end
plot(t_graph, x1_graph, '.' , ...
     t_graph, x2_graph, '.' , ...
     t_graph, x3_graph, '.')

% Other options
legend('analytical x1', 'analytical x2', 'analytical x3', ...
       'ode23s x1', 'ode23s x2', 'ode23s x3', ...
       'ode45 x1', 'ode45 x2', 'ode45 x3', ...
       'eiler x1', 'eiler x2', 'eiler x3')
