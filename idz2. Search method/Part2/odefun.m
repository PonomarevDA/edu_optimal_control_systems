function f = odefun(t,x)
global um t1 t2
if t < t1
    u = um/t1*t;
else
    u = -um/(t2-t1)*t + um*t2/(t2-t1);
end

f = -0.5*x + u;
end