clear; clc;
load('X.mat');
for n = 0:1:127
    sum = 0;
    for i = 0:1:127
        wk = 2 * pi * i / 128;
        inner = X(i+1) * exp(j * wk * n);
        sum = sum + inner;
    end
    xn(n+1) = (1/128) * sum;
end
plot(0:1:127,xn,"Color",'r','LineStyle',':','LineWidth',1.3);
axis([0 128 -2.5 2.5]);
xlabel("time samples, n");
ylabel("x(n)");
hold on;
for i = 0:1:127
    if i==13 || i==26 || i==102 || i==115
    else
        X(i+1)=0;
    end
end
for n = 0:1:127
    sum = 0;
    for i = 0:1:127
        wk = 2 * pi * i / 128;
        inner = X(i+1) * exp(j * wk * n);
        sum = sum + inner;
    end
    xn(n+1) = (1/128) * sum;
end
plot(0:1:127,xn,"Color",'b');
legend("true","estimate");
title("reconstructed signal");
