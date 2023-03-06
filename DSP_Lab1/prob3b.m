clear all;
n=0:1:200;
h(1) = delta_function(0);
h(2) = 0.5*h(1) + 2*delta_function(0);
h(3) = 0.5*h(2) - 0.25*h(1);
h(4) = 0.5*h(3) - 0.25*h(2) + delta_function(0);
for i = 5:1:201
    h(i) = 0.5*h(i-1) - 0.25*h(i-2) + delta_function(i) + 2*delta_function(i-1) + delta_function(i-3);        
end
for i = 0:1:200
    x(i+1) = (10 + 2.*cos(0.3.*pi.*i) + 5.*sin(0.6.*pi.*i)).*unit_step(i);
end
y = conv(h,x);
for i = 0:1:200
    newY(i+1) = y(i+1);
end
stem(n,newY, "MarkerSize",7,"Marker",".","Color",'r');
xlabel('n');
ylabel('y[n]');
title('Output y[n] of the system');
