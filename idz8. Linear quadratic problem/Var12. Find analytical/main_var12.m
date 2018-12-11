close all; clear; clc
% variant 12. PonomarevDA
% idz8. Linear quadratic problem
% 1. Получить аналитическое выражение x1(t), x2(t), u0(t) для опт. проц.
% 2. Построить графики x1(t), x2(t), u0(t) для оптимального процесса

disp('Данные варианта и исходные данные:')
syms x1 x2 psi1 psi2 u psi1_0 psi2_0 s
L = 2.2
x1_0 = 1
x2_0 = 0
x1_finish = 0
x2_finish = 0
J = L*x1^2 + u^2
dx1dt = -2*x1 + x2
dx2dt = -x2 + u % здесь u, в дальнейшем от этой переменной нужно избавиться

disp('1. Считаем гамильтониан, его производную по u, затем выражаем u')
H = psi1*dx1dt + psi2*dx2dt - J
dHdu = diff(H, u)
u = solve(dHdu, u)

disp('2. Получаем уравнения для сопряженных переменных')
dpsi1dt = -diff(H, x1)
dpsi2dt = -diff(H, x2)

disp('3. В dx1dt, dx2dt избавляемся от u, выражая ее через другие П.С.')
dx1dt = subs(dx1dt)
dx2dt = subs(dx2dt)

disp('4. Считаем матрицы А, В исходной системы')
A = [diff(dpsi1dt, psi1)    diff(dpsi1dt, psi2)     diff(dpsi1dt, x1)   diff(dpsi1dt, x2); ...
     diff(dpsi2dt, psi1)	diff(dpsi2dt, psi2)     diff(dpsi2dt, x1)   diff(dpsi2dt, x2); ...
     diff(dx1dt, psi1)      diff(dx1dt, psi2)       diff(dx1dt, x1)   diff(dx1dt, x2); ...
     diff(dx2dt, psi1)      diff(dx2dt, psi2)       diff(dx2dt, x1)   diff(dx2dt, x2)]
B = [psi1_0; psi2_0; x1_0; x2_0]

disp('5. По лапласу находим psi1(s), psi2(s), x1(s), x2(s)')
A1 = -A + diag([s s s s])
delta = det(A1)
roots = solve(delta, s)
%roots = double(roots)

A1_for_delta1 = A1; A1_for_delta1(1,1) = B(1); A1_for_delta1(2,1) = B(2); A1_for_delta1(3,1) = B(3); A1_for_delta1(4,1) = B(4)
delta1 = det(A1_for_delta1)
psi1_from_s = delta1/delta

A1_for_delta2 = A1;A1_for_delta2(1,2) = B(1); A1_for_delta2(2,2) = B(2); A1_for_delta2(3,2) = B(3); A1_for_delta2(4,2) = B(4)
delta2 = det(A1_for_delta2)
psi2_from_s = delta2/delta

A1_for_delta3 = A1;A1_for_delta3(1,3) = B(1); A1_for_delta3(2,3) = B(2); A1_for_delta3(3,3) = B(3); A1_for_delta3(4,3) = B(4)
delta3 = det(A1_for_delta3)
x1_from_s = delta3/delta

A1_for_delta4 = A1;A1_for_delta4(1,4) = B(1); A1_for_delta4(2,4) = B(2); A1_for_delta4(3,4) = B(3); A1_for_delta4(4,4) = B(4)
delta4 = det(A1_for_delta4)
x2_from_s = delta4/delta

disp('6. Выражаем u(s) через psi1(s), psi2(s), x1(s) и x2(s)')
u = subs(u, psi1, psi1_from_s);
u = subs(u, psi2, psi2_from_s);
u = subs(u, x1, x1_from_s);
u = subs(u, x2, x2_from_s)

disp('7. Раскладываем на простейшие, т.е. приводим к удобному виду для ilaplace')
syms A2 B2 C2 D2
% Здесь большой кастыль. Нужно получить числитель и знаменатель u.
% Я раскладываю на множители. Ручкамими смотрю, какой из них относится к 
% знаменателю и на основе этого решаю.
% Возможны несколько варианто: комплексные корни, вещественные и т.п., кратные.
% В моем случае вещественные и не кратные
% num     A
% --- = ----- + ... =
% den   (s-s1)
% Cкрипт для расчета формулы для моего случая:
syms A B C D
target_num = C*(s-roots(1))*(s-roots(2))*(s-roots(4)) + D*(s-roots(1))*(s-roots(2))*(s-roots(3));
charpoly(target_num, s)

u_factors = factor(u);
u_num = u_factors(1)*u_factors(2)*u_factors(3);
charpoly(u_num, s)
u_den = u_factors(4)^(-1)

disp('8. Ручками считаем постоянные интегрирования A2, B2, C2, D2')
equations = [(- C - D) == - (5*psi2_0)/2, ...
             + (C*(5/2 - 5^(1/2)/10)^(1/2) + D*(5^(1/2)/10 + 5/2)^(1/2)) ==  + ((5*psi1_0)/2 - (5*psi2_0)/2), ...
             + ((5*C)/2 + (5*D)/2 + (5^(1/2)*C)/10 - (5^(1/2)*D)/10 + 1) == + ((15*psi1_0)/2 + 10*psi2_0 + 12), ...
             - (5*C*(5/2 - 5^(1/2)/10)^(1/2))/2 - (5*D*(5^(1/2)/10 + 5/2)^(1/2))/2 - (5^(1/2)*C*(5/2 - 5^(1/2)/10)^(1/2))/10 + (5^(1/2)*D*(5^(1/2)/10 + 5/2)^(1/2))/10 == 5*psi1_0 + 10*psi2_0 + 11]
answerFull = solve(equations, psi1_0, psi2_0, C, D)
C = double(answerFull.C)
D = double(answerFull.D)
u_num = C*(s-roots(4)) + D*(s-roots(3))

disp('9. Обратное преобразование Лапласа. Получаем u(t)')
u_from_t = ilaplace(C/(s-roots(3))) + ilaplace(D/(s-roots(4)))

disp('10. Строим график u(t)')
figure;
calculate_u = @(t, x) - exp(-t*(5^(1/2)/10 + 5/2)^(1/2))*(55972337316742414939901996826624*5^(1/2) + 839585059751136224098529952399360)/(112307447139679650679510632938997*5^(1/2) - 6603861951293686653983484018688) - (exp(-t*(5/2 - 5^(1/2)/10)^(1/2))*(28031688165418814654295574219740356090656928563200*5^(1/2) - 802827559372246513645364068078656071765138289459200))/((29391915444156749*5^(1/2) + 914941871198738565)*(112307447139679650679510632938997*5^(1/2) - 6603861951293686653983484018688));
odefun = @(t, x) [-2*x(1) + x(2); -2*x(2) + calculate_u(t)];
[t, x] = ode45(odefun, [0 5], [x1_0 x2_0]);
subplot(2, 1, 1); plot(t, calculate_u(t))
subplot(2, 1, 2); plot(t, x)

% disp('11. Второй способ')
% Исходные данные:
syms K1 K2 s
dx1dt = -2*x1 + x2
dx2dt = -x2 - K1*x1 - K2*x2
new_A = [diff(dx1dt, x1) diff(dx1dt, x2); diff(dx2dt, x1) diff(dx2dt, x2)]

old_u_num = u_num;
new_A1 = [s 0; 0 s] - new_A
new_den = det(new_A1)
new_A1_for_x1 = [x1_0 new_A1(1,2); x2_0 new_A1(2,2)]
new_A1_for_x2 = [new_A1(1,1) x1_0; new_A1(2,1) x2_0]
new_x1_num = det(new_A1_for_x1)
new_x2_num = det(new_A1_for_x2)
new_u_num = -K1*new_x1_num - K2*new_x2_num
old_den = (s - roots(3))*(s - roots(4))
a = solve([new_u_num == old_u_num, new_den == old_den], K1, K2, psi1_0, psi2_0, s);
K1_double = double(a.K1)
K2_double = double(a.K2)
new_u = -a.K1*x1 - a.K2*x2

t = 0:0.01:10;
figure;
%calculate_new_u = @(x) - x(1)*((2221065237164045*(5/2 - 5^(1/2)/10)^(1/2))/562949953421312 - (6950358605289889*(5^(1/2)/10 + 5/2)^(1/2))/2251799813685248) - x(2)*(((5/2 - 5^(1/2)/10)^(1/2)*(5^(1/2)/10 + 5/2)^(1/2))/2 - (2221065237164045*(5/2 - 5^(1/2)/10)^(1/2))/1125899906842624 + (6950358605289889*(5^(1/2)/10 + 5/2)^(1/2))/4503599627370496 - 1);
calculate_u2 = @(x) - x(1)*0.8 - x(2)*0.16;
odefun2 = @(t, x) [-2*x(1) + x(2); -2*x(2) + calculate_u2(x)];
[t, x] = ode45(odefun2, [0 5], [x1_0 x2_0]);
arr_u2 = zeros(1, length(t));
for i = 1:length(t)
    arr_u2(i) = calculate_u2(x(i, :));
end
subplot(2, 1, 1); plot(t, arr_u2)
subplot(2, 1, 2); plot(t, x)