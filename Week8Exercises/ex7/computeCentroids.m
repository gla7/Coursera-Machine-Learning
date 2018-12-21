function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

# for each centroid
for i = 1:size(centroids, 1),
  # make a row vector that will iteratively add the positions of the centroid's closest examples
  sum = zeros(1, n);
  # keep track of how many examples have this centroid as its closest for averaging at the end
  count = 0;
  # iterate over each selected centroid and add each corresponding row of X to the running sum
  # and keep track of how many examples have this centroid as their closest
  for j = 1:size(idx, 1),
    if idx(j) == i,
      sum = sum + X(j, :);
      count = count + 1;
    end;  
  end;
  # assign the average position to the centroid
  if count ~= 0,
    centroids(i, :) = sum ./ count;
  end;  
end;

% =============================================================


end

