clc; clear; close all;

% Метод 3. Косвенный метод. Стандартный полином.
w0 = 0.3;
[w, time] = fminsearch('fminearch_function', w0)