function[centerMass] = find_center_of_mass(zero, one, two, three, four, five, six, seven, eight)

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

centerMass = zeros(2,1);
centerMass(1) = (aMass(1) + bMass(1) + cMass(1) + dMass(1) + eMass(1) + fMass(1) + gMass(1) + hMass(1) + iMass(1) + jMass(1) + kMass(1) + lMass(1) + mMass(1))/13;
centerMass(2) = (aMass(2) + bMass(2) + cMass(2) + dMass(2) + eMass(2) + fMass(2) + gMass(2) + hMass(2) + iMass(2) + jMass(2) + kMass(2) + lMass(2) + mMass(2))/13;







