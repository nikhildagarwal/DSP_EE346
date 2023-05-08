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
f = 600:1:1600;

figure (1);
[H1,w1] = freqz(N1,1,f,fs);
[max1,index1] = max(abs(H1));
H1 = abs(H1) ./ max1;
plot(w1,H1);
hold on;
height1 = [H1(freqArray(1)-599) H1(freqArray(2)-599) H1(freqArray(3)-599) H1(freqArray(4)-599) H1(freqArray(5)-599) H1(freqArray(6)-599) H1(freqArray(7)-599)];
plot(freqArray,height1,"LineStyle","none","Marker",".","Color",'r','MarkerSize',15);
title('normalized spectrume of decoded key 2');
ylabel('magnitude');
xlabel('frequency (Hz)');
axis([600 1600 0 1.2]);
legend('DTFT','code values');
indices = [1 6];
xticks(freqArray(indices));
xticklabels(freqArray(indices));
hold off;

figure (2);
[H2,w2] = freqz(N2,1,f,fs);
[max2,index2] = max(abs(H2));
H2 = abs(H2) ./ max2;
plot(w2,H2);
hold on;
height2 = [H2(freqArray(1)-599) H2(freqArray(2)-599) H2(freqArray(3)-599) H2(freqArray(4)-599) H2(freqArray(5)-599) H2(freqArray(6)-599) H2(freqArray(7)-599)];
plot(freqArray,height2,"LineStyle","none","Marker",".","Color",'r','MarkerSize',15);
title('normalized spectrume of decoded key 3');
ylabel('magnitude');
xlabel('frequency (Hz)');
axis([600 1600 0 1.2]);
legend('DTFT','code values');
indices = [1 7];
xticks(freqArray(indices));
xticklabels(freqArray(indices));
hold off;

figure (3);
[H3,w3] = freqz(N3,1,f,fs);
[max3,index3] = max(abs(H3));
H3 = abs(H3) ./ max3;
plot(w3,H3);
hold on;
height3 = [H3(freqArray(1)-599) H3(freqArray(2)-599) H3(freqArray(3)-599) H3(freqArray(4)-599) H3(freqArray(5)-599) H3(freqArray(6)-599) H3(freqArray(7)-599)];
plot(freqArray,height3,"LineStyle","none","Marker",".","Color",'r','MarkerSize',15);
title('normalized spectrume of decoded key 7');
ylabel('magnitude');
xlabel('frequency (Hz)');
axis([600 1600 0 1.2]);
legend('DTFT','code values');
indices = [3 5];
xticks(freqArray(indices));
xticklabels(freqArray(indices));
hold off;






