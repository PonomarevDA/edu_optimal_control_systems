function transitionTime = calculate_transition_time(t, x)
%@brief Calculate transition time for each state variabels and return max
%@param t - time vector with size (pointsAmount, 1)
%@param x - state variables matrix with size(pointsAmount, stateVariabelsAmount)
%@return max transition time scalar 

[pointsAmount, stateVariabelsAmount] = size(x);

transitionTime = [t(end), t(end), t(end)];
for variableNumber = 1:stateVariabelsAmount
    for i = pointsAmount : -1 : 1
        if abs(x(i, variableNumber)) > 0.05*10
            transitionTime(variableNumber) = t(i);
            break;
        end
    end
end
transitionTime = max(transitionTime);
end

