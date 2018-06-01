function [endeff] = computeMiniForwardKinematics(rads1,rads2)
beta = (1/2)*(rads1-rads2);
alpha=(1/2)*(rads1 + rads2)+pi;
L2 = 2;
L1 = 1;
r = L1*cos(pi - beta) + sqrt(L2^2 - sin(pi - beta) * sin(pi - beta));
endeff = [r*cos(alpha),r*sin(alpha)];