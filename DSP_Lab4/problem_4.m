clear; clc;
w = 0:(2*pi/200):(2*pi);
for i = 1:1:201
    top = 1 - exp(-5*j*w(i));
    topSquared = top * top;
    bottom = 1 - exp(-j * w(i));
    Sw(i) = abs(topSquared/bottom);
end
figure(1);
plot(0:2/200:2,Sw);
hold on;
Sk(1) = 0;
for i=2:1:10
    ktop = 2*(1 - ((-1) .^ (i-1)));
    kbottom = 1 - exp(-j * pi * (i-1) / 5);
    Sk(i) = ktop/kbottom;
end
plot(0:2/10:1.8,abs(Sk),"LineStyle","none","Marker","o");
legend('DTFT', 'DFT');
title("DTFT and DFT");
xlabel("ω/π");
ylabel("|S(ω)|")
hold off;

figure(2);
plot(0:10/200:10,Sw);
hold on;
plot(0:1:9,abs(Sk),"LineStyle","none","Marker","o");
legend('DTFT', 'DFT');
title("DTFT and DFT");
xlabel("DFT index, k");
ylabel("|S(ω)|")