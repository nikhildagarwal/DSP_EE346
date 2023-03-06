clear all;
n=0:1:99;
length = length(n);
h1 = [1 1/2 1/4 1/8 1/16 1/32]; %impulse of T1
h2 = [1 1 1 1 1];               %impulse of T2
h12 = conv(h1,h2);              %impulse after T1 and T2

h3 = [1/4 1/2 1/4 0 0 0 0 0 0 0]; %impulse of T3
hv = h12+h3                     %impulse after addition
for i = 11:1:100
    hv(i) = 0;
end
[rows,columns] = size(hv);
h4(1) = hv(1);
h4(2) = 0.9*h4(1) + hv(2) + hv(1);
h4(3) = 0.9*h4(2) - 0.81*h4(1) + hv(3) + hv(2);
for i=4:1:100
    h4(i) = 0.9*h4(i-1) - 0.81*h4(i-2) + hv(i) + hv(i-1);
end
stem(n,h4, "MarkerSize",7,"Marker",".","Color",'r');
xlabel('n');
ylabel('h[n]');
title('Impulse Response of Total System');












