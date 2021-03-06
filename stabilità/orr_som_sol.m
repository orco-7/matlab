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
cr = egv(2:end, 1);
ci = egv(2:end, 2);

%now it's possible to plot the solutions in respect to time or space using the 'sol' variable 

t = 0:0.01:12*pi;
nSamples = numel(t);
x = 0:0.01:30*L;


for n = 1:29 
    for j = 1:numel(t)
        for k = 1:numel(x)
            xk = x(k);
            solxk(n, :) = exp(i*alpha*xk).*exp(i*cr(n).*t).*exp(ci(n).*t);
            figure(1);
            hold on;
            plot(xk, imag(solxk))
            pause(0.05)
        end
    end
end

%
%extracts the vector of the waves 
%for j = 1:29
%	solt(j, :) = exp(i*alpha*x(4))*exp(i*cr(j).*t).*exp(ci(j).*t);
%end

%for j = 1:29
%    solx(j, :) = exp(i*alpha.*x).*exp(i*cr(j).*t(4)).*exp(ci(j).*t(4));
%end
%

%sol = exp(i*alpha*x)*exp(i*egv(1, 1).*t).*exp(egv(1, 2).*t);

%time = 0:0.1:2*pi;
%nSamples = numel(time);


