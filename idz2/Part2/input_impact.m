% input_impact.m - u(t) function
function f = input_inpact(t)
global t0, global t1, global t2, global U
for count = 1:length(t)
    f(count) = Heaviside(t(count),t0) * t(count) * U/t1 + ...
             + Heaviside(t(count),t1) * (t(count) - t1) * (-U/t1 - U/(t2-t1));
end
end

