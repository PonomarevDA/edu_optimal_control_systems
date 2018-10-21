function u = calculate_u(ksi)
global B
Um = 1;
u = Um*sign(ksi(:,1).*B(1) + ksi(:,2).*B(2));
end

