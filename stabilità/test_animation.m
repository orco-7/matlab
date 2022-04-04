clear all
time = 0:0.1:2*pi;
nSamples = numel(time);

figHandle = figure(1);

for i=1:nSamples
	plot(time,sin(time + time(i)), 'Color', 'blue');
	drawnow;
	MakeGif(figHandle, 'test.gif');
end


for i=1:nSamples
	plot(time, sin(time + time(i)), 'Color', 'green');
	drawnow;
	MakeGif(figHandle, 'test1.gif');
end

