function [C, R] = LinearPnP(X, x, K)
%% LinearPnP - Perspective-n-Point algorithm
% Getting pose from 2D-3D correspondences
% Inputs:
%     X - size (N x 3) matrix of 3D points
%     x - size (N x 2) matrix of 2D points whose rows correspond with X
%     K - size (3 x 3) camera calibration (intrinsics) matrix
% Outputs:
%     C - size (3 x 1) pose transation
%     R - size (3 x 1) pose rotation
%
% IMPORTANT NOTE: While theoretically you can use the x directly when solving
% for the P = [R t] matrix then use the K matrix to correct the error, this is
% more numeically unstable, and thus it is better to calibrate the x values
% before the computation of P then extract R and t directly

m = size(x,1);
x1 = [];
for i = 1:m
    x_temp = [0 -1 x(i,2); 1 0 -x(i,1); -x(i,2) x(i,1) 0];
    x1 = [x1; x_temp];
end
% xc=x*inv(K);
%size(x1)
%xc = K\x1';
%xc = xc';
xc = x1;

n = size(X,1);
X1 = [X ones(n,1)];
% zero1x4 = zeros(n,4,'like',X1);
zero1x4 = zeros(n,4);
% Xtilde = [X1, zero1x4, zero1x4; zero1x4, X1, zero1x4; zero1x4, zero1x4, X1];

%size(xc)
%size(Xtilde)
% A = xc * Xtilde;
% A = K\A;

A = [zero1x4 -X1  xc(:,2).*X1; X1 zero1x4 -xc(:,1).*X1; -xc(:,2).*X1 xc(:,1).*X1 zero1x4]; 

% Solve svd for A
%   1. Create A using X, x. This would be a 12xN matrix
[~,~,V] = svd(A);
%   2. Unknown is P - projection matrix

% Once P is found, use K to find [R t]. This would be a 3x4 matrix
P = reshape(V(:,end), [4,3]).';
%P = K\P;

% 3x3 corresponds to R while t corresponds to the last column
R1=P(:,1:3); 
t1=P(:,4);

[U,D,V] = svd(R1);

R = U*V';

detR=det(R);

if (abs(detR-1.0)<0.0001)
  t = t1/D(1,1);
elseif (abs(detR+1.0)<0.0001)
  R = -R;
  t = -t1/D(1,1);
else
  disp('something is wrong, det(R) neither 1.0 nor -1.0');
end

C=(-R'*t);

end