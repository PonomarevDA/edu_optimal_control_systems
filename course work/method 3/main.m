clc; clear; close all;

% Метод 1. Прямой метод. Максимальное быстродействие.
%do_maximum_speed_method()

% Метод 3. Косвенный метод. Стандартный полином.
w0 = 0.3;
[w, time] = fminsearch('fminearch_function', w0)