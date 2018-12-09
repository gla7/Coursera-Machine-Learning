function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

# setting the linear hypothesis
h = X * theta;
# errors for each training example (cache it in a variable because we will use for gradient too)
err = h - y;
# L2 cost function without regularization
JWithoutRegularization = (1 / (2 * m)) * (err' * err);
# regularization term is quadratic and excludes bias parameter
JregulatizationTerm = (lambda / (2 * m)) * ((theta(2:end, :))' * theta(2:end, :));
# join the terms together for complete cost function
J = JWithoutRegularization + JregulatizationTerm;

# first modify theta to make regularization term calculation easier
thetaModifiedForRegularization = theta;
thetaModifiedForRegularization(1) = 0;
# take an ezample where m = 4 and n = 2:
# m x 1 to m x (n + 1) and need ((n +1) x 1) => [(n + 1) x m] * [m x 1] => X' * err
# X => 1 3 4 err => 7  X' => 1 1 1 1 X' * err => 1*7 + 1*9 + 1*1 + 1*3
#      1 5 6        9        3 5 2 9             3*7 + 5*9 + 2*1 + 9*3
#      1 2 2        1        4 6 2 9             4*7 + 6*9 + 2*1 + 9*3
#      1 9 9        3      
# so this gives us the intuition that
gradWithoutRegularization = (1 / m) * (X' * err);
# regularization term is now easy to calculate
gradRegulatizationTerm = (lambda / m) * thetaModifiedForRegularization;
# join the terms together for complete gradient
grad = gradWithoutRegularization + gradRegulatizationTerm;


% =========================================================================

grad = grad(:);

end
