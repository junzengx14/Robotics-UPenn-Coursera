function X = LinearTriangulation(K, C1, R1, C2, R2, x1, x2)
%% LinearTriangulation
% Find 3D positions of the point correspondences using the relative
% position of one camera from another
% Inputs:
%     C1 - size (3 x 1) translation of the first camera pose
%     R1 - size (3 x 1) rotation of the first camera pose
%     C2 - size (3 x 1) translation of the second camera
%     R2 - size (3 x 1) rotation of the second camera pose
%     x1 - size (N x 2) matrix of points in image 1
%     x2 - size (N x 2) matrix of points in image 2, each row corresponding
%       to x1
% Outputs: 
%     X - size (N x 3) matrix whos rows represent the 3D triangulated
%       points

T1 = -R1 * C1;

T2 = -R2 * C2;

P1 = K * [R1 T1];

P2 = K * [R2 T2];

n = size(x1,1);
X = [];
for i=1:n
    a1 = x1(i,:);
    a2 = x2(i,:);
    a1 = [a1 1];
    a2 = [a2 1];
    skew1 = Vec2Skew(a1);
    skew2 = Vec2Skew(a2);

    A = [skew1*P1; skew2*P2];
    [~,~,V] = svd(A);

    X1 = V(:,end)/V(end,end);
    X1 = transpose(X1(1:3,:));
    X = [X; X1];
end
% skew1 = Vec2Skew(x1);
% skew2 = Vec2Skew(x2);
% 
% A = [skew1*P1; skew2*P2];
% [~,~,V] = svd(A);
% 
% X = V(:,end)/V(end,end);
% X = transpose(X(1:3,:));
% size(X)

end

