%function [newX] = noisAdded(X,y,eta)
load('data.mat');
X = testImages;
y = testLabels;
load('theta.mat');
for i = 1:length(y)
  if y(i) == 0
    y(i) = -1;
  end
end
exMat = sign(xderivative(y,theta,X));
newX = X + (0.025*exMat);



X = newX;
 figure;
 h = [];
 for iter = 1:100
     h(iter) = subplot(10,10,iter);
     imshow(imresize(reshape(X(iter+1084,:),[28,28]),4));
 end
load('theta.mat');
b = theta(size(theta,1),1);
theta(size(theta,1),:) = [];

prob = sigmoid(X*theta + b);
correct = 0;

for j=1:size(y,1)
  if prob(j) > 0.5
    output(j) = 1;
  else
    %output(j) = 0;
    output(j) = -1;
  end

  if output(j) == y(j)
    correct = correct +1;
  end
end

disp(correct/size(y,1));

%end
