clc; clear; close all;
global K1 K2
K1 = 0.1618; K2 = 0.1591;
fminsearch('fms', [K1 K2])
