clear 
close all
clc

format long e 


alpha = 1; 

L = 0.05;

lam = 2*pi*L;

%collects the matrix dumped in the file by user input 
%this are the real and imaginary components of the eigenvslues solutions of the Orr-Somerfield equation for our problem
egv = csvread("mat.csv");

%now it's possible to plot the solutions in respect to time or space using the 'sol' variable 

t = 0:0.01:12*pi;
nSamples = numel(t);
x = 2*pi;

%extracts the vector of the waves 
%for j = 1:29
%	sol(j) = exp(i*alpha*x)*exp(i*egv(j, 1).*t).*exp(egv(j, 2).*t);
%end

sol = exp(i*alpha*x)*exp(i*egv(1, 1).*t).*exp(egv(1, 2).*t);

%time = 0:0.1:2*pi;
%nSamples = numel(time);

figHandle = figure(1);

for i=1:nSamples
	plot(time, sol, 'Color', 'blue');
	drawnow;
	MakeGif(figHandle, 'test.gif');
end


%for i=1:nSamples
%	plot(time, sin(time + time(i)), 'Color', 'green');
%	drawnow;
%	MakeGif(figHandle, 'test1.gif');
%end

