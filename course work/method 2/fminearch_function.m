function transitionTime = fminearch_function(parameters)
global K
K = parameters;

% Численное решение при заданных коэффициентах К
[t, x] = ode45('odefun', [0 50], [0 0 10 0]);
transitionTime = calculate_transition_time(t, x);

% Построение графиков 
u = zeros(length(t), 1);
for i = 1:length(t)
    u(i) =  control_impact(x(i, :));
end
subplot(3, 1, 1); plot(t, x(:, 1:3)); title('Переходные процессы, фи(t), w(t), B(t)'); grid on;
subplot(3, 1, 2); plot(t, u); title('Скорость поворота руля, u(t)'); grid on;
subplot(3, 1, 3); plot(t, x(:, 4)); title('Угол поворота руля, d(t)'); grid on;
pause(0.1)
end

