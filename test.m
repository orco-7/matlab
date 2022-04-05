clear
close all
clc

format long e 

alpha = 1;
L = 0.5;   %semi-height 
lam = 2*pi*L %wavelength 

%reads the eigenvalues from a csv files and stores them in two vectors 
egv = csvread("stabilità/mat.csv");
cr = egv(:, 1);  %real component of the eigenvalue 
ci = egv(:, 2);  %imaginary component of the eigenvalue 

a1 = animatedline('Color',[0 .7 .7]);
a2 = animatedline('Color',[0 .5 .5]);

axis([0 20 -1 1])
x = linspace(0, 12*pi, 100);
t = linspace(0, 20, 100);

for k = 1:length(x)
    % first line
    xk = x(k);
    yk = exp(i.*alpha.*xk).*exp(i*cr(k)*t(k)).*(exp(ci(k)).*t(k))
    addpoints(a1,xk,yk);

    %% second line
    %ycos = cos(xk);
    %addpoints(a2,xk,ycos);

    % update screen
    drawnow limitrate
end

