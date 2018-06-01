function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
A = zeros(8,9);
for i = 1:4
    x = video_pts(i,:);
    xprime = logo_pts(i,:);
    
    A(2*i-1,:) = [-x(1),-x(2),-1,0,0,0,x(1)*xprime(1),x(2)*xprime(1),xprime(1)];
    A(2*i,:) = [0,0,0,-x(1),-x(2),-1,x(1)*xprime(2),x(2)*xprime(2),xprime(2)];
end

[~, ~, V] = svd(A);
H = reshape(V(:,end), [3 3]);
end

