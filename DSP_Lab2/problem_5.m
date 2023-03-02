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

figure(3);
b = [0 sin(w0) sin(2*w0) sin(3*w0) sin(4*w0) sin(5*w0) sin(6*w0) sin(7*w0) sin(8*w0) sin(9*w0) sin(10*w0) sin(11*w0) sin(12*w0) sin(13*w0) sin(14*w0) sin(15*w0) sin(16*w0) sin(17*w0) sin(18*w0) sin(19*w0)]; %z transform of s[n]
a = [1];
[h,omega] = freqz(b,a,'whole',w);
plot(omega,abs(h));
xlabel("ω");
ylabel("|h|");
title("Normalized Spectrum of DTFT S(ω) using freqz");


