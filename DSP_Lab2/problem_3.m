problem3n = 0:1:120;
for i = 1:1:121
    if i>=0 && i<=24
        problem3h(i) = 0.95 .^ problem3n(i);
    else
        problem3h(i) = 0;
    end
end
d = @(n) double(n==0);
problem3x = d(problem3n)+2.*d(problem3n-40)+2.*d(problem3n-70)+d(problem3n-80);
length(problem3x)
plot(problem3n,problem3x);
hold on;
y = conv(problem3h,problem3x);
for i = 1:1:121
    problem3y(i) = y(i);
end
plot(problem3n,problem3y);

axis([0 120 -1 3])
xlabel("n");
ylabel("output signal amp");
title("LTI property");
legend("input signal x[n]","output signal y[n]");