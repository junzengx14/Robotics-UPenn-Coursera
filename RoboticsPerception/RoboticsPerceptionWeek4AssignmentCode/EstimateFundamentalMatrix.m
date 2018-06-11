function F = EstimateFundamentalMatrix(x1, x2)
%% EstimateFundamentalMatrix
% Estimate the fundamental matrix from two image point correspondences 
% Inputs:
%     x1 - size (N x 2) matrix of points in image 1
%     x2 - size (N x 2) matrix of points in image 2, each row corresponding
%       to x1
% Output:
%    F - size (3 x 3) fundamental matrix with rank 2

m = size(x1,1);
x1 = [x1 ones(m,1)];
x2 = [x2 ones(m,1)];

A = [];
for i=1:m
  abc = kron(x1(i,:),x2(i,:));
  A = [A; abc];
end

[~,~,V] = svd(A);

F1 = (reshape(V(:, end), 3, 3)).';

[UF,DF,VF] = svd(F1);
DF(3,3) = 0;

F = UF*DF*VF';

% detF=det(F);
% if (abs(detF-1.0)<0.0001)
%     F(:,1)=-F(:,1); 
%     detF=-detF; 
% end
% F=(detF^(-1/3))*F;

end