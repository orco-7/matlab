clear 
close all 
clc

format short e

%parameters used in the Simulink simulation, these need to be the same as
%the ones used in the Simscape Mask, note that the Simulink units are in SI
%while in Simscape the units are inconsistent for convenience reason 
rho = 3000.0;
L = 1.0;
W = 0.100;
H = 0.100;
g = 9.81;

%boundary conditions used in Simulink to solve the differential equation 
%the same conditions need to be inserted in the Revolute Joint Mask in
%Simscape N.B: angles are computed differently between Simulink and
%Simscape: Simulink's pi/2 is equivalent to 0 in Simscape 
v0 = 0;
theta0 = -pi/2;

%solver configuration
t0 = 0;
tf = 10;
myopts = simset('MaxStep', 0.01);

%simulation launch
sim('simulink1', [t0, tf], myopts);
sim('simscape1', [t0, tf], myopts);


%%%%plots
%theta
figure(1);
plot(time.data, theta.data, 'r', time_s.data, (theta_s.data)-pi/2, 'g');
xlabel('t');
ylabel('\theta');
%alpha
figure(2);
plot(time.data, theta2.data, 'r', time_s.data, -alpha.data, 'g');
xlabel('t');
ylabel('\theta''''');
