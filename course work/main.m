clc; clear; close all;
w0 = 0.3;
[w, time] = fminsearch('fminearch_function', w0)