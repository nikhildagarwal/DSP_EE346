clear; clc;
id = 200007257; %my RUID number
y = dtmfsig(id);
n = 0:0.9/7200:(0.9-(0.9/7200));
for i = 1:1:7200
    if i>=1 && i<=2400
        N1(i) = y(i);
    end
    if i>=2401 && i<=4800
        N2(i-2400) = y(i);
    end
    if i>=4801 && i<=7200
        N3(i-4800) = y(i);
    end
end
freqArray = [697 770 852 941 1209 1336 1477];
N = length(N1);
fs = 8000;
f = linspace(0,fs*0.9 / 3,N);
[H1,w1] = freqz(N1,1,f,fs);
[H2,w2] = freqz(N2,1,f,fs);
[H3,w3] = freqz(N3,1,f,fs);
[max1,max1Indices] = maxk(abs(H1),2);
fprintf('Digit one frequencies: ');
fprintf('%dHz ', max1Indices);
fprintf('\n');
[max2,max2Indices] = maxk(abs(H2),2);
fprintf('Digit two frequencies: ');
fprintf('%dHz ', max2Indices);
fprintf('\n');
[max3,max3Indices] = maxk(abs(H3),2);
fprintf('Digit two frequencies: ');
fprintf('%dHz ', max3Indices);
fprintf('\n');



