function k = calculate_K(w0)
%brief Calculate control impact coefficients K1, K2, K3 and show roots of
%system Ax=B
%@param w0 - base frequency scalar
%@return control impact coefficient vector with size (3, 1)

global A B
I = [1 0 0; 0 1 0; 0 0 1];
syms k1 k2 k3 s; 
characteristicPolynomial = det((A + (B')*[k1 k2 k3]) - s*I);
binomialPolynomial = s^3 + 3*w0*s^2 + 3*w0^2*s + 1*w0^3;
[k1_roots, k2_roots, k3_roots, s_roots] = solve( characteristicPolynomial == binomialPolynomial);

for i = 1:length(k1_roots)
    if k1_roots(i) ~= '0'
        k(1) = double(k1_roots(i));
        break
    end
end

for i = 1:length(k2_roots)
    if k2_roots(i) ~= '0'
        k(2) = double(k2_roots(i));
        break
    end
end

for i = 1:length(k3_roots)
    if k3_roots(i) ~= '0'
        k(3) = double(k3_roots(i));
        break
    end
end
end

