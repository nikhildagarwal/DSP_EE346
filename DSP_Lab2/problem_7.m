w1 = 0.2*pi;
w2 = 0.4*pi;
L = 40;
P = @(w) L.*exp(-1.*1j.*w.*(L-1)) .* ((sinc((w.*L)./(2.*pi)))./(sinc((w)./(2.*pi))));
S1 = @(w) (1./(2.*1j)).*(P(w-w1)-P(w+w1));
S2 = @(w) (1./(2.*1j)).*(P(w-w2)-P(w+w2));
S = @(w) S1(w)+ 0.8.*S2(w);
w = -pi:(2*pi)/10001:pi;
f = @(w) -abs(S(w));
measuredw1 = fminbnd(f,0.15*pi,0.25*pi)
measuredw2 = fminbnd(f,0.35*pi,0.45*pi)
0.1950*pi
.4030*pi

