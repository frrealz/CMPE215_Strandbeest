function[M] = component_mass(point1, point2)
% returns the center of mass as x and y components
% point 1 is start of link
% point 2 is end of link
% n is number of segments
% M is 2x1 vector with x and components

M = zeros(2,1);

M(1) = (point2(1)+point1(1))/2;
M(2) = (point2(2)+point1(2))/2;

% deltaY = point2(2)-point1(2);
% deltaX = point2(1)-point1(1);
% theta = atan2(deltaY, deltaX);
% length = sqrt(deltaX^2 + deltaY^2)
% dX = cos(theta)*length/segments
% dY = sin(theta)*length/segments
% 
% xSum = point1(1);
% ySum = point1(2);
% 
% for i = 1:segments
%     xSum = xSum + dX
%     ySum = ySum + dY;
% end
% 
% M(1) = xSum/segments;
% M(2) = ySum/segments;

end