clc; close all; clear;
syms s s1 s2 s3 s4 A B C D
num = A*(s-s2)*(s-s3)*(s-s4) + B*(s-s1)*(s-s3)*(s-s4) + C*(s-s1)*(s-s2)*(s-s4) + D*(s-s1)*(s-s2)*(s-s3)
charpoly(num, s)