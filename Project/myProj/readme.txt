Adversarial Examples - Readme

File Description:
init.m - File to start the code, will start from learning with prompt, proceed to predicting and then adding noise to input
costFun.m - Consists the cost function, which is a softplus function
softplus.m - File containing softplus function
sigmoid.m - File having sigmoid functionality
xDerivative.m - function that computes the x derivative before adding noise
predict.m - function to run test sets
noise.m - function that will add noise, and run values on test set. Has code to visualize the corrupted input, but commented out

After invoking init.m - The following will be the response.

>> init
Loaded data...
You want to skip learning and continue with saved weights? [y/n]y
Predicting the test set without any noise added...
prediction accuracy without noise: 
    0.9935

Adding fast gradient noise to the input...
Please enter an epsilon value: 0.025
Running test set with the learned weights...
Accuracy with epsilon value 0.025000 the test set: 0.879797 
