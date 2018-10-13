function k = calculate_control_impact_coefficients(w0)
%brief Calculate control impact coefficients K1, K2, K3 and show roots of
%system Ax=B
%@param w0 - base frequency scalar
%@return control impact coefficient vector with size (3, 1)

global A B POLY_TYPE SYSTEM_DEGREE
a = get_poly_coefficients(SYSTEM_DEGREE, POLY_TYPE);

%A1 = matrix derived from det(A(x)+B(x) - s*I)
A1 = [0                          0                           1; ...             % s^2
     A(1,3)                      A(2,3)                     -A(1,1) - A(2,2); ... % s^1
     -A(1,3)*A(2,2)+A(1,2)*A(2,3) -A(1,1)*A(2,3)+A(1,3)*A(2,1) A(1,1)*A(2,2)];  % s^0

%B1 = matrix derived from det(A(x)+B(x) - s*I) and poly of POLY_TYPE type
B1 = [A(1,1) + A(2,2) + A(3,3) + a(3)*w0; ...
     -A(1,1)*A(2,2) - A(1,1)*A(3,3) - A(2,2)*A(3,3) + A(1,3)*A(3,1) + A(1,2)*A(2,1) + A(2,3)*A(3,2) + a(2)*w0^2; ...
     -A(1,3)*A(2,2)*A(3,1) - A(3,3)*A(1,2)*A(2,1) - A(1,1)*A(2,3)*A(3,2) + A(1,2)*A(2,3)*A(3,1) + A(1,3)*A(2,1)*A(3,2) + A(1,1)*A(2,2)*A(3,3) + a(1)*w0^3];

% Coefficients:
k = A1\B1;

% Original system characteristic polynomial roots with found coefficients:
roots(poly(A - (k*B)'));
end

