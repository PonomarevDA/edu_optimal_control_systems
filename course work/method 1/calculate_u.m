function u = calculate_u(t)
global t1 t2 T
u = zeros(length(t), 1);
for i = 1:length(t)
    if t(i) <= t1
        u(i) = -1;
    elseif t(i) <= t2
        u(i) = 1;
    elseif t(i) <= T
        u(i) = -1;
    else
        u(i) = 0;
    end
end
end


