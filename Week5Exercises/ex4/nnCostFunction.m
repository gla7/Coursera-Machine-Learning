function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

# add column of biases (x_0) to the features => (m x (n + 1)) (n = number of features, m = number of training examples)
X = [ones(m, 1) X];

# get z2i = theta_0 * x_0i + ... + theta_n * x_ni and then go sigmoid(zji) => (s_2 x m) (s_2 = number of units in layer 2)
a2 = sigmoid(Theta1 * X');

# add column of biases (x_0) to the activations of the hidden layer => ((s_2 + 1) x m)
a2 = [ones(1, size(a2, 2)); a2];

# obtain z3i following a similar procedura as above => (s_L x m)
h = sigmoid(Theta2 * a2);

# re-format y from being m x 1 to being (s_L x m)
Y = zeros(size(h, 1), size(h, 2));
for i = 1:size(y, 1),
  Y(y(i), i) = 1;
end;

# calculate unregularized cost function comparing unit-wise y and h and then summing over rows(each output unit) and columns (training examples)
costNotRegularized = (1 / m) * sum(sum((-Y .* log(h)) - ((1 - Y) .* log(1 - h))));
J = costNotRegularized;

# sum all the weights excluding bias terms and add these to the cost function to get the regularized version
biasSumOfSquares = sumsq(Theta1(:, 1)) + sumsq(Theta2(:, 1));
costRegularizationTerm = (lambda / (2 * m)) * (sumsq(nn_params) - biasSumOfSquares);
J = J + costRegularizationTerm;

# initialize DELTA^l = DELTA^l + Delta^(l + 1) * a^l^T
deltaDiff_1 = zeros(size(Theta1));
deltaDiff_2 = zeros(size(Theta2));

# for each training example
for i = 1:m,
  # a_1 are just the input layer values for the ith training example
	a_1 = X(i,:);  
  # z_2 are the a_1 times the weights for the input-middle layer like a_j * theta_ij
	z_2 = a_1 * Theta1';
  # a_2 are the activations for the hidden layer, so we add a bias activation and the rest is a_2 = sigmoid(z_2)
	a_2 = [1 sigmoid(z_2)];
  # similar to z_2
	z_3 = a_2 * Theta2';
  # similar to a_2 but with no bias because it's the output (s_L x 1)
	a_3 = sigmoid(z_3);
  # ith training example real output (s_L x 1)
  y_i = Y'(i, :);
	
  # output layer delta is just a_3 - y_i (s_L x 1)
	delta_3 = a_3 - y_i;
  # repeat recursively
	delta_2 = delta_3 * Theta2 .* sigmoidGradient([1 z_2]);
	
  # add cumulatively for every training example
	deltaDiff_1 = deltaDiff_1 + delta_2(2:end)' * a_1;
	deltaDiff_2 = deltaDiff_2 + delta_3' * a_2;
end;

# obtain gradient for each layer of weights
Theta1_grad = deltaDiff_1 / m;
Theta2_grad = deltaDiff_2 / m;

# add regularization to non-bias weights
Theta1_grad(:, 2: input_layer_size + 1) = Theta1_grad(:, 2: input_layer_size + 1) + lambda / m * Theta1(:, 2: input_layer_size + 1);
Theta2_grad(:, 2: hidden_layer_size + 1) = Theta2_grad(:, 2: hidden_layer_size + 1) + lambda / m * Theta2(:, 2: hidden_layer_size + 1);

# return gradient unrolled
grad = [Theta1_grad(:) ; Theta2_grad(:)];



% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
