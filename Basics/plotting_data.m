# plotting data

disp('to plot two axis:')

t = [0:0.01:0.98]; # generate a vector from 0 to 0.98 in 0.01 increments, denoting time

y1 = sin(2 * pi * 4 * t);

y2 = cos(2 * pi * 4 * t);

hold on; # to plot various plots at the same time

xlabel('time')

ylabel('value')

plot(t, y1, 'b') # x then y

plot(t, y2, 'r')

legend('cos', 'sin ')

title('demo plot')

print -dpng 'demo_plot.png' # save plot as a file

disp('to close plot:')

close

disp('to plot as two figures in two windows:')

figure(1); plot(t, y1);
figure(2); plot(t, y2);

close
close

disp('for a subplot 1 row and 2 columns:')

subplot(1, 2, 1);
plot(t, y1);
subplot(1, 2, 2);
plot(t, y2, 'r');

disp('set the axes:')

axis([0.5 1 -1 1]);

disp('to clear the plot:')

clf;

close

