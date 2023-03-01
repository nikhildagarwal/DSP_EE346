figure(1);
L = 40;
p = @(n) double(n>=0 & n<=L-1);
w0 = 0.2*pi;
s = @(n) sin(w0.*n).*p(n);
n = -5:1:45;
stem(n,s(n),"Marker",".","MarkerSize",8,Color='r');
axis([-5 45 -1.5 1.5])
xlabel("n");
ylabel("s[n]");
title("Single Sinusoid, ω0 = 0.2π");

figure(2);
P = @(w) L.*exp(-1.*1j.*w.*(L-1)) .* ((sinc((w.*L)./(2.*pi)))./(sinc((w)./(2.*pi))));
S = @(w) (1./(2.*1j)).*(P(w-w0)-P(w+w0));
w = -pi:(2*pi)/1001:pi;
plot(w,abs(S(w)./S(w0)));
xlabel("ω");
ylabel("|S(ω) / S(ω0)");
title("Normalized Spectrum of DTFT S(ω), ω0 = 0.2π");

