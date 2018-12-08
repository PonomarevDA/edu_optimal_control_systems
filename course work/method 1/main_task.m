function main_task()
global t1 t2 T x t

figure; grid on;
fminsearch('fmsfun', [t1 t2 T]);
fprintf("Specify combination of switching times are:\nt1 = %f, t2 = %f, t3 = %f\n", t1, t2, T);
fprintf("Specify end point is:\nx1_end = %f, x2_end = %f, x3_end = %f\n\n", x(end, :));
fprintf("Transition time = %f\n\n", calculate_transition_time(t, x));
end

