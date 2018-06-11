function E = EssentialMatrixFromFundamentalMatrix(F,K)
%% EssentialMatrixFromFundamentalMatrix
% Use the camera calibration matrix to esimate the Essential matrix
% Inputs:
%     K - size (3 x 3) camera calibration (intrinsics) matrix
%     F - size (3 x 3) fundamental matrix from EstimateFundamentalMatrix
% Outputs:
%     E - size (3 x 3) Essential matrix with singular values (1,1,0)


E1 = transpose(K)*F*K;

[U,~,V] = svd(E1);

E = U*[1 0 0; 0 1 0; 0 0 0]*V';

% d=det(E);
% if d<0; E(:,1)=-E(:,1); d=-d; end
% E=(d^(-1/3))*E;

end