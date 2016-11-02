function [J] = costFun(theta,X,y,lambda)

m = length(y); % number of training examples

J = 0;

b = theta(size(theta,1),1);
theta(size(theta,1),:) = [];

% classifying y as either {1,-1} which are the two classes
for j = 1:size(y,1)
  if (y(j) == 0)
    y(j) = -1;
  end
end

h = softplus(-1*y.*sigmoid(X*theta + b));

% Labelling 1 as one class and -1 as the other
temp = 0;
for j = 1:size(X,1)
      temp = temp + h(j);
end
J = 1/m*(temp);
end
