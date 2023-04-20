clear; clc;
load('X.mat');
magX = abs(X);
stem(0:1:127,magX,Marker=".");
title("DFT vector X");
xlabel("DFT index, k");
ylabel("Magnitude of X")
axis([0 127 -5 70]);
n = 0:1:127;
[magXsorted,order] = sort(magX,'descend');
magXsorted
newIndexOrder = n(order)
disp("f1 = "+newIndexOrder(1));
disp("f2 = "+newIndexOrder(3));
disp("-f2 = "+newIndexOrder(4));
disp("-f1 = "+newIndexOrder(2));
