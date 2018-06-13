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

TIMES = 500;
SCALAR = 0.3;
SAMPLES = 1080;
constant = SCALAR/TIMES

SCALAR = 0;

ratio = 0;
ratio_array = zeros(TIMES+1,1);
ratio_array(1) = 0.4320;
step_size_array = zeros(TIMES,1);

for i=1:TIMES
    [lengths, ratio, step_size] = simulate(SCALAR, SAMPLES, lengths, ratio);
    SCALAR = SCALAR + constant;
    ratio_array(i+1) = ratio;
    step_size_array(i) = step_size;
    step_size
end




FULLCIRCLE = linspace(0,360,1000);
end_points = zeros(length(FULLCIRCLE),2);
zero = zeros(2,1);


DRAW = 1;
if(DRAW)
    hold on
    figure(1)
    axis([-100 50 -100 50]);
    for i = 1:length(FULLCIRCLE)
        theta02 = FULLCIRCLE(i)*pi/180;
        two = create_vector(lengths(13), theta02);     %arbitrary value, angle should rotate from 0 to 360
        one = vector_xy(0,-lengths(12));
        four = one + vector_xy(-lengths(1),0);

        %%%%%%%%
        const = four - two;
        theta23 = vector_solve(lengths(10), -lengths(2), const);
        three = two + create_vector(lengths(10), theta23(2));

        %%%%%%%
        const = three - four;
        theta46 = vector_solve(lengths(4), -lengths(5), const);
        six = four + create_vector(lengths(4), theta46(1));

        %%%%%%%
        const = four - two;
        theta25 = vector_solve(lengths(11), -lengths(3), const);
        five = two + create_vector(lengths(11), theta25(1));

        %%%%%%%
        const = five - six;
        theta67 = vector_solve(lengths(6), -lengths(7), const);
        seven = six + create_vector(lengths(6), theta67(2));


        %%%%%%%
        const = five - seven;
        theta78 = vector_solve(lengths(8), -lengths(9), const);
        eight = seven + create_vector(lengths(8), theta78(2));

        end_points(i,:) = eight;
    end

    line2points(one, zero, 'b', '1');
    line2points(four, one, 'b', '4');
    line2points(zero, two, 'r', '0');
    line2points(two, three, 'r', '2');
    line2points(three, four, 'r', '3');
    line2points(six, four, 'r', '6');
    line2points(three, six, 'r', '3');
    line2points(five, two, 'r', '5');
    line2points(five, four, 'r', '5');
    line2points(seven, six, 'r', '7');
    line2points(seven, five, 'r', '7');
    line2points(eight, seven, 'r', '8');
    line2points(eight, five, 'r', '8');

    scatter(end_points(:,1), end_points(:,2));
end

figure(2)
plot(ratio_array)
title('Ratio of time on ground per simulation')
xlabel('Simulation Number');
ylabel('Ratio');
% figure(3)
% plot(step_size_array)


lengths
ratio
step_size