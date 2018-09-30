function create_graph_for_options_and_show_analysis(opt)
%@brief Create graph ode45 and show analysis:
%- tic/toc
%- analysis (see do_analysis())
%@param opt - ode45 options object

global T B

tic
[t, x] = ode45('idz1_fun', [0 T], B, opt);
toc
grid on; hold on; 
plot(t, x, 'o')

legend('x1(t) analytical', ...
       'x2(t) analytical', ...
       'x3(t) analytical', ...
       'x1(t) ode45', ...
       'x2(t) ode45', ...
       'x3(t) ode45')
xlabel('t'); ylabel('x(t)');

do_analysis(t, x)
end

