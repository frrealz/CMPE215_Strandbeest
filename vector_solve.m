function[out] = vector_solve(A, B, K)
    % this functions solves the following for theta and phi
    %Acos(theta) + Bcos(phi) = K(1)
    %Asin(theta) + Bsin(phi) = K(2)
    out = zeros(2,1);
    alpha = K(1);
    beta = K(2);
    C = (alpha^2 + beta^2 + A^2 - B^2)/(2*A);
    out(1) = 2*atan((beta + sqrt(beta^2+alpha^2-C^2))/(alpha+C));
    out(2) = 2*atan((beta - sqrt(beta^2+alpha^2-C^2))/(alpha+C));
end