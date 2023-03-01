n = -15:1:35;
L = 20;
for i = 1:1:51
    p(i) = unit_step(n(i)) - unit_step(n(i)-L);
end
stem(n,p)