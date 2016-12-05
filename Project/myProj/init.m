% loading data
load('data.mat');
tic;
X = trainImages;
y = trainLabels;
disp('Loaded data...');

x = input('You want to skip learning and continue with saved weights? [y/n]','s');
if (strcmp(x,'y'))
else
% Intialize theta values
initial_theta = zeros(size(X,2)+1,1);

options = optimset('MaxIter', 100);
disp('Learning from training data...');
disp('This will take approximately 10 minutes');
[theta,J] = ...
  fminunc(@(t)(costFun(t, X, y)), initial_theta, options);
disp('Learnt weights from training. Saving weights...');
save('theta.mat','theta');
end
toc;
predict();
noise();
