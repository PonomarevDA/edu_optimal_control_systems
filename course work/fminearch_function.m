function transitionTime = fminearch_function(w0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global K
K = calculate_K(w0);
x0 = [0 0 10];
[t, x] = ode45('odefun', [0 10], x0);
transitionTime = calculate_transition_time(t, x);

fprintf("w0 = %f, t = %f, k = [%f, %f, %f]\n", w0, transitionTime, K)

subplot(2, 1, 1); plot(t, x); legend('омега - угловая скорость рысканья', 'бетта - угол дрейфа', 'фи - угол рысканья')
subplot(2, 1, 2); plot(t, control_impact(x'))
pause(0.1)
end

