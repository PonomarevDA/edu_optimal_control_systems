function transitionTime = calculate_transition_time(t, x)
%@brief Calculate transition time for each state variabels and return max
%@param t - time vector with size (pointsAmount, 1)
%@param x - state variables matrix with size(pointsAmount, stateVariabelsAmount)
%@return max transition time scalar 

pointsAmount = length(t);

transitionTime = inf;
for i = pointsAmount : -1 : 1
	if abs(x(i, 1)) > 0.05
        transitionTime = t(i);
        break;
	end
end
end

