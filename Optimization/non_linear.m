clear all
close all
clc

%% Function and plot
fcn = @(x, y) log(1 + 3*(y - (x.^3 - x)).^2 + (x-4/3).^2);
fsurf(fcn, [-2.5 2.5], 'ShowContours', 'on');
xlabel('x');
ylabel('y');
title('My function f(x, y)');


%% Problem-based solution
prob = optimproblem;
x = optimvar('x', 'LowerBound', -2.5, 'UpperBound', 2.5);
y = optimvar('y', 'LowerBound', -2.5, 'UpperBound', 2.5);
prob.Objective =  (1 + 3*(y - (x.^3 - x)).^2 + (x-4/3).^2);
initialpt.x = -1;
initialpt.y = 2;
options = optimoptions(prob, 'Display', 'iter');
% options = optimoptions(prob, 'Display', 'iter', 'OutputFcn', @plotUpdate);
[sol, fval, exitflag, output] = solve(prob, initialpt, 'Options', options)
disp("Number of function evaluations = " + output.funcCount);

