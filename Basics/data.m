# data manipulation

disp('to get size, use size function:')

A = [
  1 2;
  3 4;
  5 6
]

size(A)

size(A, 1)

size(A, 2)

disp('length gives the size of the longest dimension:')

v = [1 2 3 4 5]

length(v)

disp("we wont demo here, but to load a file, we can go load('featureX.dat'), and maybe load into a variable?")

disp("who and whos command gives you variables in current scope:")

who

whos

disp("clear command will clear a variable, say A:")

clear A

who

disp("you can save a variable into a file by using save command:")

v = [1 2 3 4 5 6 7]

save demo.mat v

disp("to access a certain element of a metrix:")

A = [
  1 2;
  3 4;
  5 6
]

A(1, 1)

A(:, 1)

A(2, :)

A([1, 3], 1)

disp("we can also use this notation do make assignments:")

A(1, 1) = 9

A(1, 1)

disp("we can append a column vector to the right:")

v = [7; 8; 9]

A = [A, v]

disp("we can append a row vector to the bottom:")

v = [1 2 3]

A = [A; v]

disp("we can do the same with matrices:")

A = [
  1 2;
  3 4;
  5 6
]

B = [
  7 8;
  9 10;
  11 12
]

C = [A B]

C = [A; B]

