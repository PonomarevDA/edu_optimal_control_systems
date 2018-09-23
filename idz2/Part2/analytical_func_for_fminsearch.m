% analytical_func_for_fminsearch - function for fminsearch
function f = analytical_func_for_fminsearch(U)
% func_for_fminsearch(U) return abs( f(U, t = 9) )
% So, it should be used in fminsearch() function
global t0, global t1, global t2
t = 9;
f = 10*exp(-0.5*t) ...
    + U/t1*(2*t+4*exp(-0.5*t)-4) ...
    + U*(-1/t1 - 1/(t2-t1)) * (2*(t-t1) + 4*exp(-0.5*(t-t1)) - 4)*Heaviside(t, t1);
f = abs(f);
end

