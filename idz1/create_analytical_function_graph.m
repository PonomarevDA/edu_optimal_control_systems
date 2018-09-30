function create_analytical_function_graph()
%@brief Create graph for analytical function in idz1

T = 4.59;
t = 0:0.01:T;
for funcCount = 1:3
    funcValues = analytical_function(t);
    hold on;
    plot(t, funcValues(funcCount, :), '-')
end
end

