function a = get_poly_coefficients(degree, polyType)
%@brief get coefficients of standart polynomial
%@param degree - poly degree
%@param degree - poly type
%return vector with size degree+1
a = zeros(1, degree + 1);
switch polyType
    case 1 % Binominal Polynomials (Newton Polynomials)
        if degree == 3
            a = [1 3 3 1];
        end
    case 2 % Butterworth Polynomials
        if degree == 3
            a = [1 2 2 1];
        end
    case 3 % Polynomials that minimize the functional
        if degree == 3
            a = [1 2 1 1];
        end
    case 4 % Polynomials that minimize the functional
        if degree == 3
            a = [1 2.15 1.75 1];
        end
end
end

