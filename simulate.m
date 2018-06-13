function [best_length, best_ratio, step_size] = simulate(SCALAR, SAMPLES, lengths, ratio)

FULLCIRCLE = linspace(0,360,SAMPLES);
end_points = zeros(length(FULLCIRCLE),2);


best_length = lengths;
best_ratio = ratio;
DELTA = 15;
step_size = DELTA;
EPSILON = 1;

for j = 1:1
    lengths = best_length + rand*SCALAR - SCALAR/2;
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
    
    %finds the ratio of time spent within EPSILON on miniumum to total time
    %essentially finds the ratio of time on ground to total time
    reference_min = min(end_points(:,2));
    counter = 0;
    for i = 1:length(FULLCIRCLE)
        if(abs(end_points(i,2) - reference_min) < EPSILON)
            counter = counter + 1;
        end
    end 
    ratio = counter/length(end_points);
    
    %finds the step height
    step_height = max(end_points(:,2)) - reference_min;
    
%     best_length = lengths;
    %sets step height and ground ratio
    if(ratio > best_ratio)
%     if((ratio > best_ratio) && (DELTA < (step_height)))
       best_ratio = ratio;
       best_length = lengths;
       step_size = step_height;
    end
end



end



