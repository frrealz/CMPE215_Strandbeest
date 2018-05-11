function out = create_vector(mag, angle)

out = zeros(2,1);
out(1) = mag*cos(angle);
out(2) = mag*sin(angle);

end