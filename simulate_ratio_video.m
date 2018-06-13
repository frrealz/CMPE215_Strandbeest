clear all
close all

a = 38.0;
b = 41.5;
c = 39.3;
d = 40.1;
e = 55.8;
f = 39.4;
g = 36.7;
h = 65.7;
i = 49.0;
j = 50.0;
k = 61.9;
l = 7.8;
m = 15.0;
lengths = [a b c d e f g h i j k l m];

TIMES = 499;
SCALAR = 0.3;
SAMPLES = 1080;
constant = SCALAR/TIMES

SCALAR = 0;

ratio = 0;
ratio_array = zeros(TIMES+1,1);
ratio_array(1) = 0.4320;
step_size_array = zeros(TIMES,1);



v = VideoWriter('ratio_vid');
v.FrameRate = 30;
open(v);

for i=1:TIMES
    [lengths, ratio, step_size] = simulate(SCALAR, SAMPLES, lengths, ratio);
    SCALAR = SCALAR + constant;
    ratio_array(i+1) = ratio;
    step_size_array(i) = step_size;
    step_size
    
    figure(1)
    
    plot(ratio_array(1:i));
    xlim([0 500]);
    ylim([0.43 0.47]);
    pause(0.01);
    title('Ratio of time on ground per simulation')
    xlabel('Simulation Number');
    ylabel('Ratio');
    
    
    F = getframe(gcf);
    writeVideo(v, F);
end


close(v);
% figure(3)
% plot(step_size_array)


lengths
ratio
step_size