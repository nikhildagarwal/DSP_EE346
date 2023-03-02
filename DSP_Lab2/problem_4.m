problem4n = -15:1:35;
L = 20;
p = @(n) double(n>=0 & n<=L-1);
problem4p = p(problem4n);
figure(1);
stem(problem4n,problem4p,"Marker",".","MarkerSize",8,Color='r');
axis([-15 35 -1 2])
xlabel("n");
ylabel("p[n]");
title("Unit-Step Implementation");
legend("p[n] = u[n] - u[n-L]")
figure(2);
L = 20;
P = @(w) L.*exp(-1.*1j.*w.*(L-1)) .* ((sinc((w.*L)./(2.*pi)))./(sinc((w)./(2.*pi))));
w = -pi:(2.*pi)/1001:pi;
plot(w,abs(P(w)/P(0)));
xlabel("ω");
ylabel("|P(ω) / P(ω0)|");
title("Normalized Spectrum of DTFT P(ω), ω0 = 0");

figure(3);
b = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]; %z transform of p[n]
a = [1];
[h,omega] = freqz(b,a,'whole',w);
plot(omega,abs(h));
xlabel("ω");
ylabel("|h|");
title("Normalized Spectrum of DTFT P(ω) using freqz");
