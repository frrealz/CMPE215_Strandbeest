function[centerMass] = find_center_of_mass(zero, one, two, three, four, five, six, seven, eight)

rL = vecnorm(one-zero)';
rM = vecnorm(two-zero)';
rA = vecnorm(four-one)';
rJ = vecnorm(three-two)';
rK = vecnorm(five-two)';
rB = vecnorm(four-three)';
rE = vecnorm(six-three)';
rC = vecnorm(five-four)';
rD = vecnorm(six-four)';
rG = vecnorm(seven-five)';
rI = vecnorm(eight-five)';
rF = vecnorm(seven-six)';
rH = vecnorm(eight-seven)';

aMass = component_mass(one, four);
bMass = component_mass(three, four);
cMass = component_mass(four, five);
dMass = component_mass(four, six);
eMass = component_mass(three, six);
fMass = component_mass(six, seven);
gMass = component_mass(five, seven);
hMass = component_mass(seven, eight);
iMass = component_mass(five, eight);
jMass = component_mass(two, three);
kMass = component_mass(two, five);
lMass = component_mass(zero, one);
mMass = component_mass(zero, two);

rsum = rA+rB+rC+rD+rE+rF+rG+rH+rI+rJ+rK+rL+rM;


centerMass = zeros(2,1);
centerMass(1) = (rA*aMass(1) + rB*bMass(1) + rC*cMass(1) + rD*dMass(1) + rE*eMass(1) + rF*fMass(1) + rG*gMass(1) + rH*hMass(1) + rI*iMass(1) + rJ*jMass(1) + rK*kMass(1) + rL*lMass(1) + rM*mMass(1))/rsum;
centerMass(2) = (rA*aMass(2) + rB*bMass(2) + rC*cMass(2) + rD*dMass(2) + rE*eMass(2) + rF*fMass(2) + rG*gMass(2) + rH*hMass(2) + rI*iMass(2) + rJ*jMass(2) + rK*kMass(2) + rL*lMass(2) + rM*mMass(2))/rsum;







