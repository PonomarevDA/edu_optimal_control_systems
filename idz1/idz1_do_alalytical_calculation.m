function idz1_do_alalytical_calculation(delta_add, delta)
% Create plot and display calculated data
% Предполагается, что порядок полиномов числителя и знаменателя <= 3

global A;
t = 0:0.01:5;

disp('1. Исходная x(s):')
if length(delta_add) == 3
    fprintf('%d*s^2 + %d*s + %d\n', delta_add)
else
    fprintf('%d*s + %d\n', delta_add)
end
fprintf('---------------------------\n')
fprintf('%d*s^3 + %d*s^2 + %d*s + %d\n\n', delta)

disp('2. Корни ХП:')
disp(roots(delta))

disp('3. Преобразуем знаменатель x(s)')
disp('мысленно')
disp(' ')

disp('4. Чтобы юзать таблицу преобразований Лапласа, нужно разложить на простейшие дроби:')
[r, p, k] = residue(delta_add, delta);

disp('Разложенная на простейшие дроби x(s):')
fprintf('%f + %fj              %f + %fj               %f + %fj\n', real(r(1)), imag(r(1)), real(r(2)), imag(r(2)), real(r(3)), imag(r(3)))
fprintf('---------------------------  +  ---------------------------  +  ---------------------------\n')
fprintf('s - (%f + %fj)      s - (%f + %fj)      s - (%f + %fj)\n', real(p(1)), imag(p(1)), real(p(2)), imag(p(2)), real(p(3)), imag(p(3)))
disp('Получается какая-то муть, это из-за комплесных чисел :(')
disp(' ')

disp('5. Тогда выполняем разложение в "удобную табличную" форму.')
disp('В идеале нужно получить так:')
fprintf('     Ai*(s-L)                   Bi*w              Ci\n')
fprintf('------------------  +  ------------------  +  --------\n')
fprintf('(s-lambda)^2 + w^2     (s-lambda)^2 + w^2     s-lambda\n\n')
disp('А у нас так:')
if length(delta_add) == 3
    fprintf('%d*s^2 + %d*s + %d\n', delta_add)
else
    fprintf('%d*s + %d\n', delta_add)
end
fprintf('--------------------------------\n')
fprintf('((s-lambda)^2 + w^2) * (s-lambda)\n\n')
disp('Тогда считаем:')
disp('[A*(s-L1) + B*w]*[s - L2] + C*[(s-L1)^2 + w^2] = !num!')
disp('A*s^2 - A*L1*s + B*w*s - A*s*L2 + A*L1*L2 - B*w*L2 + C*s^2 - 2*s*L1*C + C*L1^2 + C*w^2 = !num!')
disp(' ')
disp('И решаем систему уравнений:')

lambda1 = real(p(1))
lambda2 = real(p(3))
w = abs(imag(p(2)))

matrix = zeros(3);  
matrix(1, 1) = 1;                   % A*s^2
matrix(1, 3) = 1;                   % C*s^2
matrix(2, 1) = -lambda2 - lambda1;  % - A*L1*s- A*s*L2
matrix(2, 2) = w;                   % B*w*s
matrix(2, 3) = -2*lambda1;          % - 2*s*L1*C
matrix(3, 1) = lambda1*lambda2;     % A*L1*L2
matrix(3, 2) = -lambda2*w;          % - B*w*L2
matrix(3, 3) = lambda1^2 + w^2;     % + C*L1^2 + C*w^2

if length(delta_add) == 3
    delta_add = delta_add';
    rootsABC = matrix\(delta_add);
elseif length(delta_add) == 2
    delta_add = [0; delta_add'];
    rootsABC = matrix\delta_add;
else 
    delta_add = [0; 0; delta_add];
    rootsABC = matrix\delta_add;
end

for count = 1:length(delta_add)
    fprintf('%f*A + %f*B + %f*C = %f\n', matrix(count, 1:3), delta_add(count))
end
fprintf('\nПолучаем коэффициенты:\n')
fprintf('Ai = %f, Bi = %f, Ci = %f\n\n', rootsABC)

fprintf('Конечная (табличная) форма:\n')
fprintf('%f*(s-L1)          %f*w           %fi\n', rootsABC(1), rootsABC(2), rootsABC(3))
fprintf('------------------  +  ------------------  +  --------\n')
fprintf('(s-lambda1)^2 + w^2     (s-lambda1)^2 + w^2     s-lambda2\n\n')

disp('6. Аналитическая запись, полученная по таблице преобразования Лапласа')
fprintf('x(t) = \n')
fprintf('%f * cos(%f*t) * e^(%f*t) +\n%f * sin(%f*t) * e^(%f*t)\n\n', rootsABC(1), w, lambda1);
fprintf('%f * sin(%f*t) * e^(%f*t)\n', rootsABC(2), w, lambda1);
fprintf('%f * e^(%f*t) +\n\n', rootsABC(3), lambda2);
plot(t, rootsABC(3)*exp(t*lambda2) + rootsABC(1)*cos(w*t).*exp(lambda1*t) + rootsABC(2)*sin(w*t).*exp(lambda1*t)) % analytical

disp('7. For fun Комплексная форма записи:')
fprintf('x(t) = \n')
fprintf('(%f+ %fj) * e^(t*(%f+ %fj)) + ', real(r(2)), imag(r(2)), real(p(2)), imag(p(2)))
fprintf('(%f+ %fj)*e^(t*(%f+ %fj))\n\n', real(r(1)), imag(r(1)), real(p(1)), imag(p(1)))
%plot(t, r(3)*exp(t*p(3)) + r(2)*exp(t*p(2)) + r(1)*exp(t*p(1))) % accuraty
end

