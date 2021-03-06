close all; clear all; clc;
d = 4;
theta = 10;
n = 20;
fprintf('Specified subspace dimension (d): %d\n', d);
fprintf('Specified angle (theta): %d degrees \n', theta);
fprintf('Ambient dimension (n): %d \n', n);
[A, B, C] = spx.la.spaces.three_disjoint_spaces_at_angle(d, deg2rad(theta)); 
spx.la.spaces.describe_three_spaces(A, B, C);
% Put them together
X = [A B C];
% Put them to bigger dimension
X = spx.la.spaces.k_dim_to_n_dim(X, n);
% Perform a random orthonormal transformation
O = orth(randn(n));
X = O * X;
% Split them again
A = X(:, 1:d);
B = X(:, d + (1:d));
C = X(:, 2*d + (1:d));
fprintf('Spaces after moving to n dimensions and an orthonormal transformation');
spx.la.spaces.describe_three_spaces(A, B, C);
