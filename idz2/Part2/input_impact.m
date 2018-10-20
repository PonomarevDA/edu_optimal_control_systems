function f = input_impact(t)
global t_start t_top t_end U
f = zeros(1, length(t));
for count = 1:length(t)
    f(count) = Heaviside(t(count),t_start) * t(count) * U/t_top + ...
             + Heaviside(t(count),t_top) * (t(count) - t_top) * (-U/t_top - U/(t_end-t_top));
end
end

