top = [2 1];
bottom = [1 -1 -1];
h=tf(top,bottom);
figure(1)
pzplot(h);

figure(2)
n = 0:1:50;
for i = 1:1:51
    hn(i) = (0.106 .*((-0.618).^n(i)) + 1.894 .*(1.618.^n(i))) .* unit_step(n(i));
end
stem(n,hn)
xlabel("n");
ylabel("h[n]");
title("Impulse response h[n] from part(c)");

figure(3)
impz(top,bottom,51);
title("Impulse response h[n] difference equation");