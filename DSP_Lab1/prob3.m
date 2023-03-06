clear all;
n=0:1:100;
h(1) = delta_function(0);
h(2) = 0.5*h(1) + 2*delta_function(0);
h(3) = 0.5*h(2) - 0.25*h(1);
h(4) = 0.5*h(3) - 0.25*h(2) + delta_function(0);
for i = 5:1:101
    h(i) = 0.5*h(i-1) - 0.25*h(i-2) + delta_function(i) + 2*delta_function(i-1) + delta_function(i-3);        
end

stem(n,h, "MarkerSize",7,"Marker",".","Color",'r');
xlabel('n');
ylabel('h[n]');
title('Impulse Response of Total System');
