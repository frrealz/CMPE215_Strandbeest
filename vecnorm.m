function [N] = vecnorm(A)
% Returns the vector-wise norm of A
    for i = 1:length(A)
        N = sqrt(A(i)^2 + A(i)^2);
    end
end