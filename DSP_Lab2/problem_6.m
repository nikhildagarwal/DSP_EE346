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

figure(3);
b = [0 sin(w1)+0.8*sin(w2) sin(w1*2)+0.8*sin(w2*2) sin(w1*3)+0.8*sin(w2*3) sin(w1*4)+0.8*sin(w2*4) sin(w1*5)+0.8*sin(w2*5) sin(w1*6)+0.8*sin(w2*6) sin(w1*7)+0.8*sin(w2*7) sin(w1*8)+0.8*sin(w2*8) sin(w1*9)+0.8*sin(w2*9) sin(w1*10)+0.8*sin(w2*10) sin(w1*11)+0.8*sin(w2*11) sin(w1*12)+0.8*sin(w2*12) sin(w1*13)+0.8*sin(w2*13) sin(w1*14)+0.8*sin(w2*14) sin(w1*15)+0.8*sin(w2*15) sin(w1*16)+0.8*sin(w2*16) sin(w1*17)+0.8*sin(w2*17) sin(w1*18)+0.8*sin(w2*18) sin(w1*19)+0.8*sin(w2*19)]; %z transform of s[n]
a = [1];
[h,omega] = freqz(b,a,'whole',w);
plot(omega,abs(h));
xlabel("ω");
ylabel("|h|");
title("Normalized Spectrum of DTFT S(ω) using freqz");


