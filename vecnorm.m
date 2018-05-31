function [N] = vecnorm(A)
% Returns the vector-wise norm of A
    N = zeros(length(A),1);
    for i = 1:length(A)
        N(i) = sqrt(A(i)^2 + A(i)^2);
    end
end