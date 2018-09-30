%@file analytical_function.m
function x = analytical_function(t)
%@brief calculate function values x(t)
%@param t - vector with size (n, 1)
%@return x - matrix with size (n, 3)

lambda1 = -0.6732;
lambda2 = -0.6536;
w = 2.3805;
rootsABC_1 = [-0.2564, 0.2725, 1.2564];
rootsABC_2 = [0.8211, 0.4268, -0.8211];
rootsABC_3 = [0.3598, -1.2573, -0.3598];

x1 = rootsABC_1(3).*exp(t.*lambda2) + rootsABC_1(1).*cos(w.*t).*exp(lambda1.*t) + rootsABC_1(2).*sin(w*t).*exp(lambda1.*t);
x2 = rootsABC_2(3).*exp(t.*lambda2) + rootsABC_2(1).*cos(w.*t).*exp(lambda1.*t) + rootsABC_2(2).*sin(w*t).*exp(lambda1.*t);
x3 = rootsABC_3(3).*exp(t.*lambda2) + rootsABC_3(1).*cos(w.*t).*exp(lambda1.*t) + rootsABC_3(2).*sin(w*t).*exp(lambda1.*t);
x = [x1; x2; x3];
end
