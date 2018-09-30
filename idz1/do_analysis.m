function do_analysis(t, x)
%@brief Find and show:
%-max absolution error
%-regulation time
%@param t - array of time with size = (n, 1)
%@param x - value of function with size = (n, 3)

% 1. Find max absolution error
maxAbsErrorValues = zeros(1, 3);
maxAbsErrorTimes = zeros(1, 3);
for i = 1:length(t)
	analyticalValues = analytical_function(t(i));
	calculatedValues = (x(i, :))';
	errors = analyticalValues - calculatedValues;
    for funcCount = 1:3
        if abs(errors(funcCount)) > maxAbsErrorValues(funcCount)
            maxAbsErrorValues(funcCount) = abs(errors(funcCount));
            maxAbsErrorTimes(funcCount) = t(i);
        end
    end
end
for funcCount = 1:3
    fprintf('Max absolute error x%d on %f sec = %f\n', funcCount, maxAbsErrorTimes(funcCount), maxAbsErrorValues(funcCount))
end

% 2. Find regulation time
regulationTime = zeros(1, 3);
steadyStateValueUpperBorder = 0.05;
steadyStateValueLowerBorder = -0.05;
for funcCount = 1:3
    for count = length(t):-1:1
        if(x(count, funcCount) > steadyStateValueUpperBorder) || (x(count, funcCount) < steadyStateValueLowerBorder)
            regulationTime(funcCount) = t(count);
            fprintf('Regulation time x%d = %f\n', funcCount, regulationTime(funcCount))
            break
        end
    end
end

