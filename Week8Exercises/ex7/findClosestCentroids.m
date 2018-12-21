function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

# iterate over each example
for i = 1:size(X, 1),
  # for each example, set a high minimum distance to closest centroid and a zero index
  # which does not exist in octave
  min_distance = 9999999;
  min_distance_index = 0;
  # now iterate over the centroids
  for j = 1:size(centroids, 1),
    # calculate the squared distance between the given example and the centroid in question
    distance = sum((X(i, :) - centroids(j, :)) .^ 2);
    # if this distance is less than the current minimum distance for this example, record it
    # as the minimum and its index
    if min_distance > distance,
      min_distance = distance;
      min_distance_index = j;
    end;
  end;
  # set the index of the centroid that is closest to the example
  idx(i) = min_distance_index; 
end;


% =============================================================

end

