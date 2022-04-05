clear 
close all
clc

format short e 


%initialises matrix
A = [0, 0];

%reads the matrix from user input
for i = 0:30
	cr = input("Insert cr value: ");
	ci = input("Insert ci value: ");
	vec = [cr, ci];
	A = [A; vec];
end


A = A(2:end, :);

dlmwrite("mat.csv", A);


