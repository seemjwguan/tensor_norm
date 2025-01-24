clear all

p = 2; % spectral p-norm; p=2 for spectral norm
gamma = 10; % this parameter controls the number of grid pts; the larger the more grid pts

T = zeros(2, 2, 2); % the tensor whose norm is to be computed; currently only support 3rd-order tensors
T(2, 2, 1) = 1;
T(1, 2, 2) = 1;
T(2, 1, 2) = 1;

norm_T = nuclear_norm_handler(T, p, gamma);
fprintf("The nuclear norm of T is %f.\n", norm_T);