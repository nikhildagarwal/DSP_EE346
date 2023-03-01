L = 200;
K = 50;
n = 0:L-1;
x = double(rem(n,K)< K/2);
for i = 1:1:200
    if i<=15
        h(i) = 0.25.*(0.75 .^ n(i));
    else
        h(i) = 0;
    end
end
y = conv(x,h);
for i = 1:1:200
    newY(i) = y(i);
end
plot(n,newY);
hold on
plot(n,x);
axis([0 199 -1 2])
xlabel("n");
ylabel("output signal amp");
title("RC-integrator type fitler")
legend("filter response y[n]","square wave signal x[n]")