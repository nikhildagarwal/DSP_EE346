top1 = [1 1 1];
bottom1 = [1 0.5 -0.25];
h1=tf(top1,bottom1);
figure(1)
pzplot(h1);
title('Pole-Zero plot H1(z)');

figure(2);
top2 = [2 1.25 0.125];
bottom2 = [1 1.75 -0.5];
h2=tf(top2,bottom2);
figure(2)
pzplot(h2);
title('Pole-Zero plot H2(z)');