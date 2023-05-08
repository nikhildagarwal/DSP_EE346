clear; clc;
id = 200007257;
y = dtmfsig(id);
n = 0:0.9/7200:(0.9-(0.9/7200));
plot(n,y);
title('DTMF time signal for RUID: 200007257');
ylabel('y(t)');
xlabel('t (seconds)');