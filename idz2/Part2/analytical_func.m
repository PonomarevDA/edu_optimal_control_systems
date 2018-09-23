% analytical_func.m - analytical calculated function x(t)
function f = analytical_func(t)
global U, global t0, global t1, global t2;
f = 10*exp(-0.5.*t) ...
    + Heaviside(t, t0).*U/t1.*(2.*t+4.*exp(-0.5.*t)-4) ...
    + Heaviside(t, t1).*U.*(-1./t1 - 1./(t2-t1)) .* (2.*(t-t1) + 4.*exp(-0.5.*(t-t1)) - 4);
end

