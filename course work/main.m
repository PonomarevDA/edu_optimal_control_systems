clc; clear; close all;

% variant 12.
% vessel veriant - 4
% Solution method - standard polynomial p.2.1
global A B
V0 = 6.17;
L = 39;
r21 = -0.69;
r31 = 6.14;
q21 = 1.22;
q31 = -3.12;
s21 = -0.44;
s31 = -3.1;

W = V0/L;
a11 = -r31*W;
a12 = -q31*W^2;
a21 = -r21;
a22 = -q21*W;
b11 = -s31*W^2;
b21 = -s21*W;

A = [a11 a12 0;     % угловая скорость рысканья омега_у
     a21 a22 0;     % угол дрейфа бетта
     1   0   0];    % угол рысканья фи
B = [b11 b21 0];    % угол перекладки руля дельта_в (не больше 35 градусов)

w0 = 1.5;
[w, time] = fminsearch('fminearch_function', w0);