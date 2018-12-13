function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

# these are the values we will try with each C and with each sigms
testValues = [0.01, 0.03, 0.1, 0.3,  1, 3, 10, 30];
# initialize the best error to a high number
bestErr = 99999999999;

# iterate over each possible value for C
for i = 1:size(testValues, 2),
  # iterate over each possible value for sigma
  for j = 1:size(testValues, 2),
    # set C and sigma to the ith and jth value of testValues respectively
    currentC = testValues(i);
    currentSigma = testValues(j);
    # train the model with the current values for C and sigma
    model = svmTrain(X, y, currentC, @(x1, x2) gaussianKernel(x1, x2, currentSigma)); 
    # make predictions with this trained model against the validation set
    predictions = svmPredict(model, Xval);
    # see what error this model got when tested against the validation set
    err = mean(double(predictions ~= yval));
    # if the error is less than the current best error, these values for C and sigma
    # are the best so far, so assign these to C and sigma and keep track of the best error
    if err < bestErr,
      bestErr = err;
      C = currentC;
      sigma = currentSigma;
    end;
  end;
end;

# after going through the above, the best values found are:
# C = 1;
# sigma = 0.1;




% =========================================================================

end
