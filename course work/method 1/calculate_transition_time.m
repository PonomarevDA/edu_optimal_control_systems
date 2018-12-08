function transitionTime = calculate_transition_time(t, x)
%@brief Calculate transition time for each state variabels and return max
%@param t - time vector with size (pointsAmount, 1)
%@param x - state variables matrix with size(pointsAmount, stateVariabelsAmount)
%@return max transition time scalar 

pointsAmount = size(x, 1);
transitionTime = t(end);
for i = pointsAmount : -1 : 1
    vectorLength = (x(i,1)^2 + x(i,2)^2 + x(i,3)^2)^0.5;
	if vectorLength > 0.05*10
        transitionTime = t(i);
        break;
	end
end
end

