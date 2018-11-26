# basic commands

disp ("if you do not end in a semicolon the operations will display, e.g. 1+1="), disp (1 + 1)

disp ("if you do end in a semicolon the operations will not display, e.g. 2+3="), disp (2 + 3)

disp ("assertions where output will be 0 for false and 1 for true, e.g. 1==2"), disp (1==2)

disp ("e.g. 1~=2"), disp (1~=2)

disp ("and and or operations, e.g. 1&&0"), disp (1 && 0)

disp ("e.g. 1 || 0"), disp (1 || 0)

a = 3;

disp ("variables can be assigned like a = 3, e.g. a"), disp (a)

b = 'hi';

disp ("e.g. b"), disp (b)

c = (3 >= 1);

disp ("e.g. c"), disp (c)

d = 2.34567;

disp ("we can display specific significant figures by using sprintf function, e.g. 2.34567"), disp (sprintf('d is: %0.2f', d))


# vectors and matrices (here we will do implicit display instead of disp function for simplicity)

disp('here is a matrix:')

A = [1 2; 3 4; 5 6]

disp('another way of doing the same thing:')

A = [
  1 2;
  3 4;
  5 6
]

disp('and a row vector:')

v = [1 2 3]

disp('a column vector:')

v = [
  1;
  2;
  3
]

disp('to get a vector starting at 1, then each subsequent going up by 0.1 up to 2')

v = 1:0.1:2

disp('to generate 2 by 3 ones matrix:')

I = ones(2, 3)

disp('to generate 2 by 3 ones matrix multiplied by 2:')

I = 2 * ones(2, 3)


disp('to generate 2 by 3 zeroes matrix:')

I = zeros(2, 3)

disp('to generate 3 by 4 random matrix (0 to 1):')

I = rand(3, 4)

disp('to generate 3 by 4 random matrix normally distributed:')

I = randn(3, 4)

disp('to generate 50 by 1 random matrix normally distributed and then plot histogram:')

I = randn(50, 1)

hist(I)

disp('to generate identity matrix (3 by 3):')

I = eye(3)

disp('to get help on a function, say eye:')

help eye

