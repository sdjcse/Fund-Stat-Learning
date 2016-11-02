function g = softplus(z)
%SIGMOID Compute sigmoid function
g = zeros(size(z));
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

g = log(1 + exp(z));
end
