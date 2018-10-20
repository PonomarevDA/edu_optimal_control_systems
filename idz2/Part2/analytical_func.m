% analytical_func.m - analytical calculated function x(t)
function f = analytical_func(t)
global U t_start t_top t_end
f = 10*exp(-0.5.*t) ...
    + Heaviside(t, t_start).*U/t_top.*(2.*t+4.*exp(-0.5.*t)-4) ...
    + Heaviside(t, t_top).*U.*(-1./t_top - 1./(t_end-t_top)) .* (2.*(t-t_top) + 4.*exp(-0.5.*(t-t_top)) - 4);
end

