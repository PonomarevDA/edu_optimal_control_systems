function t_switch = find_switch_time(t_direct, x_direct, t_inverse, x_inverse)
t_switch = 0;
minError = inf;
for directCounter = 1:length(t_direct)
    for inverseCounter = 1:length(t_inverse)
        currentError = (x_inverse(length(t_inverse) - inverseCounter + 1, 2) - x_direct(directCounter, 2))^2 + ...
                       (x_inverse(length(t_inverse) - inverseCounter + 1, 1) - x_direct(directCounter, 1))^2;
        if currentError < minError
            minError = currentError;
            t_switch = t_direct(directCounter);
        end
    end
end
end

