function create_eiler_graph_with_step_and_show_analysis(step)
%@brief Create graph with method Eiler and show analysis
%@param step - integration step (scalar)

global A T

x1_graph = []; x2_graph = []; x3_graph = []; t_graph = [];
x1 = 1; x2 = 0; x3 = 0; t = 0;
dt = step;
while t < T*1.5
    x1_graph = [x1_graph x1];
    x2_graph = [x2_graph x2];
    x3_graph = [x3_graph x3];
    t_graph = [t_graph t];
    dx1 = (A(1, 1)*x1 + A(1,2)*x2 + A(1,3)*x3)*dt;
    dx2 = (A(2, 1)*x1 + A(2,2)*x2 + A(2,3)*x3)*dt;
    dx3 = (A(3, 1)*x1 + A(3,2)*x2 + A(3,3)*x3)*dt;
    x1 = x1 + dx1;
    x2 = x2 + dx2;
    x3 = x3 + dx3;
    t = t + dt;
end
hold on;
plot(t_graph, x1_graph, '-' , ...
     t_graph, x2_graph, '-' , ...
     t_graph, x3_graph, '-')
 
fprintf("Step = %f\n", step);
do_analysis(t_graph', [x1_graph; x2_graph; x3_graph]')
end

