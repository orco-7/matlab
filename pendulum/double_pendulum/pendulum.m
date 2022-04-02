clear
close all 
clc

format short e

%parameters used in the Simulink simulation, these need to be the same as
%the ones used in the Simscape Mask, note that the Simulink units are in SI
%while in Simscape the units are inconsistent for convenience reason
L1 = 0.800;
L2 = 0.600;
g = 9.81;
m1 = 0.500;
m2 = 1.2;


%boundary conditions used in Simulink to solve the differential equation 
%the same conditions need to be inserted in the Revolute Joint Mask in
%Simscape N.B: angles are computed differently between Simulink and
%Simscape: Simulink's pi/2 is equivalent to 0 in Simscape
v0 = 0;           %each mass starts with the same angular velocity, 0; this can be easily changed by defining another  
theta0 = pi/2;    %parameter , v02 N.B: this parameter must also be changed in the second Revolute Joint 
theta02 = 0;

%solver configuration
t0 = 0;
tf = 20;
myopts = simset('MaxStep', 0.01);

%simulation launch
sim('simulink4', [t0, tf], myopts);
sim('simscape4', [t0, tf], myopts);


%%%%plots
%theta
figure(1);
plot(time.data, theta_1.data, 'r', time_s.data, -((theta_s1.data)-pi/2), 'g');
xlabel('t');
ylabel('\theta');
%alpha
figure(2);
plot(time.data, theta2_1.data, 'r', time_s.data, -alpha1.data, 'g');
xlabel('t');
ylabel('\theta''''');

%theta
figure(3);
plot(time.data, theta_2.data, 'r', time_s.data, -((theta_s2.data)-pi/2), 'g');
xlabel('t');
ylabel('\theta');
%alpha
figure(4);
plot(time.data, theta2_2.data, 'r', time_s.data, -alpha2.data, 'g');
xlabel('t');
ylabel('\theta''''');
