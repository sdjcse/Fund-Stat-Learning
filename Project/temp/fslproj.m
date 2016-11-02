load('data.mat')
load('data.mat', 'testImages')
load('data.mat', 'testLabels')
load('data.mat', 'trainImages')
load('data.mat', 'trainLabels')
correct=0;
wrong=0;
maxIteration=0;
learningRate=0;
result=0;
[samples, features] = size(trainImages);
w0 = rand(features + 1, 1);
b0 = rand(1);
theta = [w0;b0];
[weight,b]=Weights( trainImages, trainLabels, theta, 500, 0.001);
options = optimset('GradObj', 'on', 'MaxIter', 400);
%[thetaUpd, J] = fminunc(@(t)(CostFunc(trainImages,trainLabels,t)),theta,options);
weight = ;
b;
result = Classification( testImages, weight,b );

 for i=1:2163
 if(result(i,1)==testLabels(i,1))
   correct=correct+1;
 else 
     wrong=wrong+1;
 end
 end

accuracy=correct/(correct+wrong)