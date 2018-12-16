function transitionTime = fminsearch_function(w0)
%@brief find transition time and create graph for w0 value
%@param w0 - base frequency value
%@return max transition time value

global K x0
K = calculate_control_impact_coefficients(w0);

[t, x] = ode45('odefun', [0 10], x0);
transitionTime = calculate_transition_time(t, x);

%plot(t, x)
%pause(0.5)
end

