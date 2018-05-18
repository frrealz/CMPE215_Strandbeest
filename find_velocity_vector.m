function [velocity_vector] = find_velocity_vector(velocity_previous, angular_velocity, vector_length)
    % first argument is previous velocity vector [3x1]
    % second argument is angular velocity (scalar)
    % third argument is the vector length [3x1]


    k = [0; 0; 1;];
    r = [vector_length(1); vector_length(2); 0]
    v_previous = [velocity_previous(1); velocity_previous(2); 0];


    v = [0; 0; 0];
    
    v = v_previous + angular_velocity * cross(k, r)

    velocity_vector = [v(1); v(2)];
end