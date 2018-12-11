clc; clear;
% Расчет примера из методы

disp('Исходные данные системы:')
syms x1 x2 dx1dt dx2dt u psi1 psi2 s psi1_start psi2_start
dx1dt = x2
dx2dt = u
J = x1^2 + u^2
x1_start = 1;
x2_start = 0;

disp('1. Считаем гамильтониан, его производную по u, затем выражаем u')
H = psi1*dx1dt + psi2*dx2dt - J
dHdu = diff(H, u)
u = solve(dHdu, u)

disp('2. Получаем уравнения для сопряженных переменных')
dpsi1dt = -diff(H, x1)
dpsi2dt = -diff(H, x2)

disp('3. Кастыль необходим, т.к. мы u выразили через переменные состояния')
dx2dt = u

disp('4. Считаем матрицы А, В исходной системы')
A = [diff(dpsi1dt, psi1)    diff(dpsi1dt, psi2)     diff(dpsi1dt, x1)   diff(dpsi1dt, x2); ...
     diff(dpsi2dt, psi1)	diff(dpsi2dt, psi2)     diff(dpsi2dt, x1)   diff(dpsi2dt, x2); ...
     diff(dx1dt, psi1)      diff(dx1dt, psi2)       diff(dx1dt, x1)   diff(dx1dt, x2); ...
     diff(dx2dt, psi1)      diff(dx2dt, psi2)       diff(dx2dt, x1)   diff(dx2dt, x2)]
B = [psi1_start; psi2_start; x1_start; x2_start]
 
disp('5. По лапласу находим psi2(s) т.к. она определеяет u')
A1 = -A + diag([s s s s])
delta = det(A1)
roots = solve(delta, s)

A1_for_delta1 = A1; A1_for_delta1(1,1) = B(1); A1_for_delta1(2,1) = B(2); A1_for_delta1(3,1) = B(3); A1_for_delta1(4,1) = B(4)
delta1 = det(A1_for_delta1)

A1_for_delta2 = A1;A1_for_delta2(1,2) = B(1); A1_for_delta2(2,2) = B(2); A1_for_delta2(3,2) = B(3); A1_for_delta2(4,2) = B(4)
delta2 = det(A1_for_delta2)

A1_for_delta3 = A1;A1_for_delta3(1,3) = B(1); A1_for_delta3(2,3) = B(2); A1_for_delta3(3,3) = B(3); A1_for_delta3(4,3) = B(4)
delta3 = det(A1_for_delta3)

A1_for_delta4 = A1;A1_for_delta4(1,4) = B(1); A1_for_delta4(2,4) = B(2); A1_for_delta4(3,4) = B(3); A1_for_delta4(4,4) = B(4)
delta4 = det(A1_for_delta4)

root2 = delta2/delta

disp('6. Раскладываем на простейшие, т.е. приводим к удобному виду для ilaplace')
syms A2 B2 C2 D2
num = (A2*s + B2)*(s-roots(1))*(s-roots(2)) + (C2*s + D2)*(s-roots(3))*(s-roots(4));
num = charpoly(num, s)
delta2 = charpoly(delta2, s)

disp('7. Ручками считаем постоянные интегрирования A2, B2, C2, D2')
equations = [(- A2 - C2) == - psi2_start, ...
             + (2^(1/2)*C2 - D2 - B2 - 2^(1/2)*A2) == + psi1_start, ...
             + (2^(1/2)*D2 - C2 - 2^(1/2)*B2 - A2 + 1) == + 3, ...
             - B2 - D2 == 0]
answerFull = solve(equations, psi2_start, psi1_start, A2, B2, C2, D2)
A2 = answerFull.A2
B2 = answerFull.B2
C2 = answerFull.C2
D2 = answerFull.D2

num = (A2*s + B2)
den = (s - roots(3))*(s - roots(4))
charpoly((s-roots(3))*(s-roots(4)), s)

disp('8. Обратное преобразование. Получам ksi2(t)')
psi2_from_t = ilaplace(num/den)

disp('9. Кастыль, лень думать')
t = 0:0.01:7;
plot(t, (- exp(2^(1/2)*t*(1/2 - 1i/2))*(1/2 + 1i/2) - exp(2^(1/2)*t*(1/2 + 1i/2))*(1/2 - 1i/2))/2)

disp('Второй способ, кажется.')
dx1dt = x2
dx2dt = u
syms K1 K2 s
u = -K1*x1 - K2*x2
A1 = [s - diff(dx1dt, x1) -diff(dx1dt, x2); K1 s+K2]
A1_for_x1 = [x1_start -diff(dx1dt, x2); x2_start s+K2]
A1_for_x2 = [s - diff(dx1dt, x1) x1_start; K1 x2_start]

den_common = det(A1)
x1_num = det(A1_for_x1)
x2_num = det(A1_for_x2)

u_num = -K1*x1_num - K2*x2_num
u_den = den_common

den = (s - roots(1))*(s - roots(2))

a = solve([u_num == num/2, u_den == den], K1, K2)

a.K1

u = -a.K1*x1 - a.K2*x2