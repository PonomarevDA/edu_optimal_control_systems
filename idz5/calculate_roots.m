clc; clear; close all;

syms ksi1 ksi2 x1 x2 s u tSwitch
dx1_dt = -x1 + 0.5*x2
dx2_dt = u
H = ksi1*dx1_dt + ksi2*dx2_dt - 1
dksi1_dt = -diff(H, x1)
dksi2_dt = -diff(H, x2)

A = [diff(dx1_dt, x1), diff(dx1_dt, x2);
     diff(dx2_dt, x1), diff(dx2_dt, x2)]
B = [1; -1/s + 2*exp(-s*tSwitch)/s]
A1 = -[s 0; 0 s] + A

delta = det(A1)

matrixForDelta1 = [B(1), A1(1,2); B(2), A1(2,2)]
delta1 = det(matrixForDelta1)

matrixForDelta2 = [A1(1,1), B(1); A1(2,1), B(2)]
delta2 = det(matrixForDelta2)

x1 = delta1/delta

x2 = delta2/delta

