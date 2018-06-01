function [rads1,rads2] = computeRrInverseKinematics(X,Y)

syms theta1 theta2;
eqn1 = cos(theta1)+cos(theta1+theta2) == X;
eqn2 = sin(theta1)+sin(theta1+theta2) == Y;
S = solve([eqn1,eqn2]);
if double(S.theta1(1)) <= pi/2 && double(S.theta1(1))>=0
    rads1=double(S.theta1(1));
    rads2=double(S.theta2(1));
else
    rads1=double(S.theta1(2));
    rads2=double(S.theta2(2));
end
end