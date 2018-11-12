function discrepancy = fmsfun(switchingTimesArray)
global t1 t2 T x x_start x_end
t1 = switchingTimesArray(1); t2 = switchingTimesArray(2) ; T = switchingTimesArray(3);
[t,x]=ode45('odefun',[0 T], x_start);
discrepancy = (x(end,1)-x_end(1))^2 + (x(end,2)-x_end(2))^2 + (x(end,3)-x_end(3))^2;
subplot(3, 1, 1), plot(t, x); title('ѕереходные процессы x1(t), x2(t), x3(t)')
subplot(3, 1, 2), plot(x(:,2), x(:,3), 'b'); title('‘азова€ плоскость x3(x2)')
subplot(3, 1, 3), plot(t, calculate_u(t), 'b'); title('”правл€ющее воздействие u(t)')
pause(0.1)
end

