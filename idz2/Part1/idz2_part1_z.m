%file idz2_part1_z.m
function z = idz2_part1_z(argv)
% argv - массив из двух элементов: x, y
% return x^2 + y^2 + 4x - 2y + 5
x = argv(1);
y = argv(2);
z = x^2 + y^2 + 4*x - 2*y + 5;
end

