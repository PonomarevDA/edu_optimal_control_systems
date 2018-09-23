%file idz2_part1_f.m
function f = idz2_part1_f(argv)
x = argv(1); y = argv(2);
z = x.^2 + y.^2 + 4.*x - 2.*y + 5;

f = -1.*exp(-0.1.*z).*cos(z);
end

