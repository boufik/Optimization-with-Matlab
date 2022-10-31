clear all
close all
clc

%% Linprog for: min(2x_1 + x_2)
display('***********************************');
display('linprog');
f = [2 1];
A = [-1 1; -1 -1; 0 -1; 1 -2];
b = [1 -2 0 4]';
[x_optimal, f_min] = linprog(f, A, b)
display('***********************************');
display(' ');


%% CVX for: min(2x_1 + x_2)
display('***********************************');
display('CVX');
cvx_begin quiet
    variable x(2);
    minimize(f*x);
    subject to
        A*x <= b;
cvx_end
disp("cvx_optval = " + num2str(cvx_optval));
display('***********************************');
display(' ');


%% Plot
figure();
num_of_constr = size(A, 1);
x = linspace(0, 1, 1001);
y = linspace(0, 3, 1001);
legends = [];
for i = 1 : num_of_constr
    z_constr = A(i, 1)*x + A(i, 2)*y;
    plot3(x, y, z_constr, 'red');
    str = "Constraint " + num2str(i);
    legends = [legends str];
    hold on
end
z_obj = f(1)*x + f(2)*y;
plot3(x, y, z_obj, 'blue');
hold on
plot3(x_optimal(1), x_optimal(2), f_min, 'gx', 'Markersize', 10);
legends = [legends "Objective Function" "Optimal Value"];
title("Linprog");
xlabel("x");
ylabel("y");
zlabel("z");
legend(legends);
