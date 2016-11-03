% loading data
load('data.mat');

X = trainImages;
y = trainLabels;


% Intialize theta values
initial_theta = zeros(size(X,2)+1,1);

options = optimset('MaxIter', 100);

[theta,J] = ...
  fminunc(@(t)(costFun(t, X, y)), initial_theta, options);
