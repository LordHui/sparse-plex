clc;
clearvars;
close all;
rng default;

% subspace dimension
D = 4;
% ambient dimension
M = 10;
% Number of subspaces
K = 2;
import spx.data.synthetic.subspaces.random_subspaces;
bases = random_subspaces(M, K, D);
A = bases{1};
B = bases{2};
G = A' * B
sigmas = svd(G)'
largest_product = sigmas(1)
smallest_angle_rad  = acos(largest_product)
smallest_angle_deg = rad2deg(smallest_angle_rad)

K = 6;
bases = random_subspaces(M, K, D);
angles = spx.la.spaces.smallest_angles_deg(bases)
angles = spx.matrix.off_diag_upper_tri_elements(angles)'

angles = spx.la.spaces.smallest_angles_rad(bases)
angles = spx.la.spaces.smallest_angles_cos(bases)

