L = 80; %change this value
w1 = 0.2*pi;
w2 = 0.4*pi;
P = @(w) L.*exp(-1.*1j.*w.*(L-1)) .* ((sinc((w.*L)./(2.*pi)))./(sinc((w)./(2.*pi))));
S1 = @(w) (1./(2.*1j)).*(P(w-w1)-P(w+w1));
S2 = @(w) (1./(2.*1j)).*(P(w-w2)-P(w+w2));
S = @(w) S1(w)+ 0.8.*S2(w);
w = -pi:(2*pi)/1001:pi;
plot(w,abs(S(w)/S(w1)));
xlabel("ω");
ylabel("|S(ω) / S(ω1)|");
title("Normalized Spectrum of DTFT S(ω), ω1 = 0.2π, ω2 = 0.4π, L = 80");