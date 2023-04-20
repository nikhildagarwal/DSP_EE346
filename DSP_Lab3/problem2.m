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

figure(3);
topOfY1Conv = conv([1 1 1],[3 -1.5])
bottomOfY1Conv = conv([1 0.5 -0.25],[1 -1 1])
impz(topOfY1Conv,bottomOfY1Conv,50);
title('Ouput y1[n] -- Impulse Response of H1(z)*X(z)');

figure(4);
topOfY1Conv = conv([2 1.25 0.125],[3 -1.5])
bottomOfY1Conv = conv([1 1.75 -0.5],[1 -1 1])
impz(topOfY1Conv,bottomOfY1Conv,50);
title('Ouput y2[n] -- Impulse Response of H2(z)*X(z)');



