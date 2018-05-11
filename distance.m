function [distance] = distance(x1, x2)
    distance = sqrt((x1(1)-x2(1))^2+(x1(2)-x2(2))^2);
end