clear all
close all


% M rotates about the origin
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

lengths = [a b c d e f g h i j  k  l  m];
%%%%%%%%%% 1 2 3 4 5 6 7 8 9 10 11 12 13


FULLCIRCLE = linspace(0,1080,300);
velocity = zeros(length(FULLCIRCLE)-1,2);
end_points = zeros(length(FULLCIRCLE),2);
accel_points = zeros(length(FULLCIRCLE)-2,2);
accel_points1 = zeros(length(FULLCIRCLE)-2,2);
accel_points2 = zeros(length(FULLCIRCLE)-2,2);
accel_points3 = zeros(length(FULLCIRCLE)-2,2);
accel_points4 = zeros(length(FULLCIRCLE)-2,2);
accel_points5 = zeros(length(FULLCIRCLE)-2,2);
accel_points6 = zeros(length(FULLCIRCLE)-2,2);
accel_points7 = zeros(length(FULLCIRCLE)-2,2);
accel_points0 = zeros(length(FULLCIRCLE)-2,2);
zero = zeros(2,1);
ANGLE = 45;





for i = 1:length(FULLCIRCLE)
    theta02 = FULLCIRCLE(i)*pi/360;
    L_M = create_vector(lengths(13), theta02);     %arbitrary value, angle should rotate from 0 to 360
    two = L_M;
    one = vector_xy(0,-lengths(12));
    L_L = vector_xy(-lengths(1),0);
    four = one + L_L;
    %%%%%%%%
    const = four - two;
    theta23 = vector_solve(lengths(10), -lengths(2), const);
    theta23 = theta23(2);           %only solution for quadratic equation
    L_J = create_vector(lengths(10), theta23);
    three = two + L_J;
    %%%%%%%
    
    const = four - three;
    theta36 = vector_solve(lengths(5), -lengths(4), const);
    theta36 = theta36(2);
    L_E = create_vector(lengths(5), theta36);
    six = three + L_E;
    
    %%%%%%%
    const = four - two;
    theta25 = vector_solve(lengths(11), -lengths(3), const);
    theta25 = theta25(1);
    L_K = create_vector(lengths(11), theta25);
    five = two + L_K;
    %%%%%%%
    const = five - six;
    theta67 = vector_solve(lengths(6), -lengths(7), const);
    theta67 = theta67(2);
    L_F = create_vector(lengths(6), theta67);
    seven = six + L_F;
    %%%%%%%
    const = five - seven;
    theta78 = vector_solve(lengths(8), -lengths(9), const);
    theta78 = theta78(2);
    L_H = create_vector(lengths(8), theta78);
    eight = seven + L_H;
    
    if(i == 1)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        angle = [theta02 theta23 theta36 theta25 theta67 theta78];
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif (i == 2)
        %finds ONLY angular velocity
        DT = 5;

        previous_angle = angle;
        angle = [theta02 theta23 theta36 theta25 theta67 theta78];
        angular_velocity = (angle - previous_angle)/DT;


        v0 = [1; 0];
        v1 = v0;
        v4 = v0;
        %should be correct now
        v2 = find_velocity_vector(v0, angular_velocity(1), L_M);        %not sure
        v3 = find_velocity_vector(v2, angular_velocity(2), L_J);        %not sure
        v5 = find_velocity_vector(v2, angular_velocity(4), L_K);        %not sure
        v6 = find_velocity_vector(v3, angular_velocity(3), L_E);        %VERY not sure
        v7 = find_velocity_vector(v6, angular_velocity(5), L_F);        %VERY not sure
        v8 = find_velocity_vector(v7, angular_velocity(6), L_H);        %VERY not sure
        velocity(i-1,:) = v8;
    else
        % finds angular velocity and angular acceleration
        previous_angle = angle;
        angle = [theta02 theta23 theta36 theta25 theta67 theta78];
        
        previous_angular_velocity = angular_velocity;
        angular_velocity = (angle - previous_angle)/DT;


        v0 = [1; 0];
        v1 = v0;
        v4 = v0;
        %should be correct now
        v2 = find_velocity_vector(v0, angular_velocity(1), L_M);        %not sure
        v3 = find_velocity_vector(v2, angular_velocity(2), L_J);        %not sure
        v5 = find_velocity_vector(v2, angular_velocity(4), L_K);        %not sure
        v6 = find_velocity_vector(v3, angular_velocity(3), L_E);        %VERY not sure
        v7 = find_velocity_vector(v6, angular_velocity(5), L_F);        %VERY not sure
        v8 = find_velocity_vector(v7, angular_velocity(6), L_H);        %VERY not sure
        velocity(i-1,:) = v8;
        
        
        angular_accel = (angular_velocity - previous_angular_velocity)/DT;
        a0 = [0; 0];
        a1 = a0;
        a4 = a0;
        a2 = find_accel_vector(a0, angular_velocity(1), angular_accel(1), theta02, lengths(13));
        a3 = find_accel_vector(a2, angular_velocity(2), angular_accel(2), theta23, lengths(10));
        a5 = find_accel_vector(a2, angular_velocity(4), angular_accel(4), theta25, lengths(11));
        a6 = find_accel_vector(a3, angular_velocity(3), angular_accel(3), theta36, lengths(5));
        a7 = find_accel_vector(a6, angular_velocity(5), angular_accel(5), theta67, lengths(6));
        a8 = find_accel_vector(a7, angular_velocity(6), angular_accel(6), theta78, lengths(8));
        accel_points(i,:) = a8;
        accel_points1(i,:) = a1;
        accel_points2(i,:) = a2;
        accel_points3(i,:) = a3;
        accel_points4(i,:) = a4;
        accel_points5(i,:) = a5;
        accel_points6(i,:) = a6;
        accel_points7(i,:) = a7;
        accel_points0(i,:) = a0;
        
        
%         figure(1);
%         subplot(1,2,1);
%         hold on;
%         title('End Effector Accel');
%         ylabel('Y Accel');
%         xlabel('X Accel');
%         axis equal;
%         plot(accel_points(2:i-2,1), accel_points(2:i-2,2), 'b-o');
%         pause(0.01);
        figure(1);
        subplot(2,3,1);
        title('End Effector Accel');
        plot(accel_points(2:i-2,1), accel_points(2:i-2,2), 'b-o');
        
        subplot(2,3,2);
        title('Joint 0');
        plot(accel_points2(2:i-2,1), accel_points2(2:i-2,2), 'b-o');
        
        subplot(2,3,3);
        title('Joint 1');
        plot(accel_points3(2:i-2,1), accel_points3(2:i-2,2), 'b-o');
        
        subplot(2,3,4);
        title('Joint 2');
        plot(accel_points5(2:i-2,1), accel_points5(2:i-2,2), 'b-o');
        
        subplot(2,3,5);
        title('Joint 2');
        plot(accel_points6(2:i-2,1), accel_points6(2:i-2,2), 'b-o');
        
        subplot(2,3,6);
        title('Joint 2');
        plot(accel_points7(2:i-2,1), accel_points7(2:i-2,2), 'b-o');
        
        
        
        pause(0.01);        
    end
end

% mag_accel = vecnorm(accel_points);
% 
% subplot(1,2,2)
% plot(mag_accel(3:end));
% title('End Effector Acceleration');
% ylabel('Acceleration');
% xlabel('Time');
% 
% 
% print -depsc end_effector_acceleration.eps
