function[computedRow] = xderivative(y,theta,X)

b = theta(size(theta,1),1);
theta(size(theta,1),:) = [];

nr = -1 .* y * theta';
dr = 1+exp(y.*(X*theta+b));

computedRow = (bsxfun(@rdivide, nr', dr'))';
end
