function sout = periodic_output(b,a,s)
    N = length(s);
    S = fft(s,N);
    for k = 0:1:N-1
        wk(k+1) = 2 * pi * k / N;
    end
    H = freqz(b,a,wk);
    Sout = H.*S;
    sout = ifft(Sout,N);
end

