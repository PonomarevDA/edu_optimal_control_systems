function calculate_roots()
%Test script

% general solution
clc; clear
syms ksi1 ksi2 x1 x2 d w u s
H = ksi1*x2 + ksi2*(-(d^2+w^2)*x1 - 2*d*x2 + u) - 1
dksi1_dt = -diff(H, x1)
dksi2_dt = -diff(H, x2)
A = [diff(dksi1_dt, ksi1), diff(dksi1_dt, ksi2);
     diff(dksi2_dt, ksi1), diff(dksi2_dt, ksi2)]
A1 = [s 0; 0 s] - A
characteristicPolynomial = det(A1)
roots = solve(characteristicPolynomial == 0, s)
end

