%function [newX] = noisAdded(X,y,eta)

X = testImages;

load('theta.mat');
exMat = sign(xderivative(y,theta,X));
newX = X + (0.5*exMat);

y = testLabels;
X = newX;
load('theta.mat');
b = theta(size(theta,1),1);
theta(size(theta,1),:) = [];

prob = sigmoid(X*theta + b);
correct = 0;

for j=1:size(y,1)
  if prob(j) > 0.5
    output(j) = 1;
  else
    output(j) = 0;
  end

  if output(j) == y(j)
    correct = correct +1;
  end
end

disp(correct/size(y,1));

%end
