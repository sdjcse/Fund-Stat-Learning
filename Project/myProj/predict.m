function [] = predict()
load('theta.mat');
load('data.mat');
disp('Predicting the test set without any noise added...');

y = testLabels;
X = testImages;

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
disp('prediction accuracy without noise: ');
disp(correct/size(y,1));
end
