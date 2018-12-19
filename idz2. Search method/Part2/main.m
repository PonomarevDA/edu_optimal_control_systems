clc; clear; close all
global t1 t2 x0 x um t
t1 = 3.5; t2 = 9; x0 = 10; UmStartSearch = 1;
um = fminsearch('fmsfun', UmStartSearch)

u = zeros(size(t));
for i = 1:length(t)
    if t(i) < t1
        u(i) = um/t1*t(i);
    else
        u(i) = -um/(t2 - t1)*t(i) + um*t2/(t2 - t1);
    end
end

figure; plot(t, x); grid on; xlabel('t', 'FontSize', 20); ylabel('x', 'FontSize', 20)
figure; plot(t, u); grid on; xlabel('t', 'FontSize', 20); ylabel('u', 'FontSize', 20)