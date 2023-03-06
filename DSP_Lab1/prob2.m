clear all;
n = 0:1:199;
for i = 0:1:250
    temp = mod(i,13);
    x(i+1) = unit_step(temp)-unit_step(temp-5)+unit_step(temp-7)-unit_step(temp-9)+unit_step(temp-10)-unit_step(temp-11)+unit_step(temp-12);
end
temp = size(n);
sigma = sqrt(1);
vn = randn(1,temp(2));
vn = vn .* sigma;
a = 0.9;
D = 20;
for i = 0:1:199
        
    y(i+1) = 0.9 .* x(i+7) + vn(i+1);
end
for i = 0:1:199
    xn(i+1) = x(i+1);
end
y;
Fs = 44100;
figure (1)
stem(n,xn, "MarkerSize",7,"Marker",".","Color",'r');
axis([0 199 -2 3]);
xlabel('n');
ylabel('x[n]');
title('Input x[n] to the System');

figure (2)
stem(n,y, "MarkerSize",7,"Marker",".","Color",'b');
axis([0 199 -2 3]);
xlabel('n');
ylabel('y[n]');
title('Output y[n] from the System');

figure(3)
[c,lags] = xcorr(xn,y);
plot(lags,c)
xlabel('ℓ (lags)');
ylabel('correlation');
title('Crosscorrelation of x[n] and y[n]');

figure(4)
for i = 201:1:260
    nL(i) = lags(i);
    nC(i) = c(i);
end
plot(nL,nC)
xlabel('ℓ (lags)');
ylabel('correlation');
title('Crosscorrelation of x[n] and y[n] (lags 0 to 59)');
