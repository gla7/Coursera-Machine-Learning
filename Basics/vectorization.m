# vectorization

disp("instead of computing h_theta = sum_j=0^j=n theta_j * x_j we can do theta^T * x:")

# sample weights for 2 features and intercept
theta = [1; 1; 1]

# a single training example
x = [1; 4; 8]

# for a single training example here is the prediction given the data point and the theta estimates:
h_theta = 0.0;
for j = 1:length(x),
  h_theta = h_theta + (theta(j) * x(j));
end;
h_theta

# and vectorized:
h_theta = theta' * x

disp("what about the gradient descent update rule? we need to define X as a matrix holding all training examples")

# so theta_j := theta_j - alpha * (1/m) * sum_i=1^m (h_theta(x^(i)) - y^(i)) * x_j^(i) being update
# that needs to convert to theta(j) = theta(j) - alpha * delta_j
# where delta_j = alpha * (1/m) * sum((theta' * X(i, :) - y(i)) * X(i, j)) is a column vector
