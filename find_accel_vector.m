function [accel_vector] = find_accel_vector(accel_previous, angular_velocity, angular_accel, angle, length)
    % first argument is previous joint's velocity vector [2x1]
    % second argument is angular velocity (scalar)
    % third argument is angular acceleration (scalar)
    % fourth argument is angle (scalar)
    % fifth argument is the length (scalar)
    temp1 = accel_previous(1) - length*(angular_accel*sin(angle) + angular_velocity^2*cos(angle));
    temp2 = accel_previous(2) + length*(angular_accel*cos(angle) - angular_velocity^2*sin(angle));

    
    accel_vector = [temp1; temp2];
end