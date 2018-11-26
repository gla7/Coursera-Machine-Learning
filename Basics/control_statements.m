# control statements

disp("for loop:")

v = zeros(10, 1)

for i = 1:10,
  v(i) = 2 ^ i;
end;

v

disp("another way:")

indeces = 1:10;

for i = indeces,
  v(i) = 2 ^ i;
end;

v

disp("note that we can use break and continue in octave, now for a while loop:")

i = 1
while i <= 5,
  v(i) = 100;
  i = i + 1;
end;

v

disp("using break and if statements with a while:")

i = 1
while true,
  v(i) = 999;
  i = i + 1;
  if i == 6,
    break;
  end;
end;

v

disp("to use if else:")

j = 35

if j < 10,
  disp('value is less than 10');
elseif j < 20,
  disp('value is less than 20');
else
  disp('value is 20 or greater');
end;

disp("keep in mind you can exit octave with the command exit")

disp("to define functions:")

function retval = squareThisNumber(x)
  retval = x ^ 2;
endfunction;

squareThisNumber(5)

# as a side-note, you can access functions defined in other directories by adding their path like eg
# addpath('/Users/gleon/Repositories/Udemy/MachineLearning/CourseraMachineLearning/Basics/OtherFunctions')

disp("to define functions with multiple returns:")

function [y1, y2] = squareAndCubeThisNumber(x)
  y1 = x ^ 2;
  y2 = x ^ 3;
endfunction;

[a, b] = squareAndCubeThisNumber(5);

a
b

disp("define a function to compute cost function J:")

# features
X = [
  1 1;
  1 2;
  1 3
];

# targets
y = [1; 2; 3];

# sample weights
theta = [0; 1];

function J = costFunction(X, y, theta)
  m = size(X, 1); # number of rows in X
  predictions = X * theta;
  sqrErrors = (predictions - y) .^ 2;
  J = (1 / (2 * m)) * sum(sqrErrors); 
endfunction;

j = costFunction(X, y, theta) # in this example we will get zero error
j = costFunction(X, y, [0; 0]) # here we should get an error







