figure(1);
L = 40;
p = @(n) double(n>=0 & n<=L-1);
w1 = 0.2*pi;
w2 = 0.4*pi;
s = @(n) (sin(w1.*n)+ 0.8.*sin(w2.*n)).*p(n);
n = -5:1:45;
stem(n,s(n),"Marker",".","MarkerSize",8,Color='r');
axis([-5 45 -2 2])
xlabel("n");
ylabel("s[n]");
title("Double Sinusoid, ω1 = 0.2π, ω = 0.4π");

figure(2);
P = @(w) L.*exp(-1.*1j.*w.*(L-1)) .* ((sinc((w.*L)./(2.*pi)))./(sinc((w)./(2.*pi))));
S1 = @(w) (1./(2.*1j)).*(P(w-w1)-P(w+w1));
S2 = @(w) (1./(2.*1j)).*(P(w-w2)-P(w+w2));
S = @(w) S1(w)+ 0.8.*S2(w);
w = -pi:(2*pi)/1001:pi;
plot(w,abs(S(w)/S(w1)));
xlabel("ω");
ylabel("|S(ω) / S(ω1)|");
title("Normalized Spectrum of DTFT S(ω), ω1 = 0.2π, ω2 = 0.4π");


