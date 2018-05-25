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


FULLCIRCLE = linspace(0,720,100);
velocity = zeros(length(FULLCIRCLE)-1,2);
end_points = zeros(length(FULLCIRCLE),2);
zero = zeros(2,1);
ANGLE = 45;


theta02 = FULLCIRCLE(1)*pi/180;
% theta02 = ANGLE*pi/360;
% theta02 = ANGLE*pi/360;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
angle = [theta02 theta23 theta36 theta25 theta67 theta78];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




for i = 2:length(FULLCIRCLE)
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
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
end


mag_velocity = vecnorm(velocity);


subplot(2,1,1);
scatter(velocity(:,1), velocity(:,2));
title('End Effector Velocity');
ylabel('Y Velocity');
xlabel('X Velocity');

subplot(2,1,2);
plot(mag_velocity);
title('End Effector Speed');
ylabel('Speed');
xlabel('Time');
print -depsc end_effector_velocity.eps


% hold on
% figure(1)
% axis([-100 50 -100 50]);
% line2points(one, zero, 'b', '1');
% line2points(four, one, 'b', '4');
% line2points(zero, two, 'r', '0');
% line2points(two, three, 'r', '2');
% line2points(three, four, 'r', '3');
% line2points(six, four, 'r', '6');
% line2points(three, six, 'r', '3');
% line2points(five, two, 'r', '5');
% line2points(five, four, 'r', '5');
% line2points(seven, six, 'r', '7');
% line2points(seven, five, 'r', '7');
% line2points(eight, seven, 'r', '8');
% line2points(eight, five, 'r', '8');





