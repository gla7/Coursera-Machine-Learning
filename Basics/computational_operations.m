# computationsl operations

A = [
  1 2;
  3 4;
  5 6
]

B = [
  11 12;
  13 14;
  15 16
]

C = [
  1 1;
  2 2
]

disp("we can do matrix multiplication:")

A * C

disp("we can do element-wise operations, i.e. A_i_j * B_i_j:")

A .* B

disp("we can do element-wise operations, i.e. A_i_j ^ 2:")

A .^ 2

disp("we can do element-wise functions too:")

v = [1 2 3]

log(v)

disp("we can add a number to each element:")

v = [1; 2; 3]

v + ones(length(v), 1) # same as v + 1

disp("we can get the transpose:")

A'

disp("we can get the max:")

max(A(:, 1))

disp("we can do element-wise comparisons:")

v = [1 2 3 4 5]

v < 3

disp("we can do find the indeces of elements that follow a rule:")

find(v < 3)

disp("sum sums all elements (we could also do ceil and floor if they were decimals):")

sum(v)

disp("we can get element wise maxes for two given matrices:")

max(rand(3), rand(3))

disp("we can get column wise max too:")

A = [
  8 1 6;
  3 5 7;
  4 9 2
]

max(A, [], 1)

disp("we can get row wise max too:")

max(A, [], 2)

disp("do column-wise and row-wise sum on magic square matrix:")

A = magic(4)

sum(A, 1)

sum(A, 2)

disp("do diagonal-wise sum on magic square matrix:")

sum(sum(A .* eye(4)))

disp("do matrix inverse:")

A = magic(3)

pinv(A)

A * pinv(A)