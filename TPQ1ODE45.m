%% ME303 TERM PROJECT
%% QUESTION 1  
%% ode45 METHOD

%% Start by closing open figures and clearing the memory and the termianl 
% outputs. 
clc
clear all
close all

%% Define the constants given to us in the question.
k_a=1/8;
k_b=0.2;
k_c=4;
k_g=0.1;
k_w=0.2;
maxBeds=1000;

%% Define the timespan that you want your function to be solved.
tspan = [0 100];

%% Define inital values.
y0 = [10000, 10, 0, 0, 0];

%% %% The implemattion of the ode method.
tic
[t, y] = ode45(@(t, y) odefun(t, y, k_c, k_b, k_a, k_g, k_w), tspan, y0);
toc

%% Plot the given variables
plot(t,y)
yline(maxBeds,'-.b');
hold on

%% Name the variables in the graph, name the x and y axis and name the 
% graph itself. Also turn on the grids for people to better see. 
legend('Suceptibles','Exposed','Infected','Medicaly Symptomatic','Recovered','Aviable Beds')
title('Simulation with ODE45')
xlabel('TIME PASSED')
ylabel('NUMBER OF PEOPLE')
grid on


%% Define the derivatives as a funciton to pass on ode45.
function dydt = odefun(t, y, c, Be, Al, Ga, Om)
dydt = zeros(5, 1);
dydt(1) = (-c*Be*y(3)/(y(1)+y(2)+y(3)+(4)+y(5))*y(1));
dydt(2) = ( c*Be*y(3)/(y(1)+y(2)+y(3)+(4)+y(5))*y(1)) - Al*y(2);
dydt(3) = (Al*y(2) - Ga*y(3));
dydt(4) = (Ga*y(3) - Om*y(4));
dydt(5) = (Om*y(4));
end