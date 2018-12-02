clc; clear; close all;

% Calculate parameters
global A B
V0 = 6.17;          L = 39;         r21 = -0.69;	r31 = 6.14;     q21 = 1.22;
q31 = -3.12;        s21 = -0.44;    s31 = -3.1;     W = V0/L;       a11 = -r31*W;
a12 = -q31*W^2;     a21 = -r21;     a22 = -q21*W;   b11 = -s31*W^2; b21 = -s21*W;
A = [a11	a12     0       b11;	% угловая скорость рысканья омега_у
     a21	a22     0       b21;	% угол дрейфа бетта
     1      0       0       0;      % угол рыскань¤ фи
     0      0       0       0];     % угол поворота руля
B = [0; 0; 0; 1];                   % коэффицинты перед управл¤ющим воздействием

% Main algorithm
parametersStart = [1.3; 10.5];
[k, time] = fminsearch('fminearch_function', parametersStart)