function u = calculate_u(ksi)
global B
u = 0.5*(ksi(:,1).*B(1) + ksi(:,2).*B(2));
end

