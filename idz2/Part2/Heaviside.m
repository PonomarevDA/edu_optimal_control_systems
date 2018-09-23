% Heaviside.m
function f = Heaviside(t, t0)
% Heaviside(t, t0) is 0 for t < t0 and 1 for t > t0
f = zeros(length(t), 1);
for count = 1:length(t)
    if t(count) > t0
        f(count) = 1;
    else
        f(count) = 0;
    end
end

