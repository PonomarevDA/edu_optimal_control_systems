function u = calculate_u(t)
global t_switch
Um = 1;
if t < t_switch
    u = -Um;
else
    u = Um;
end
end

