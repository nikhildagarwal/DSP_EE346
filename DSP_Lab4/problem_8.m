clear; clc;
dftmat = @(N) exp(-2.*pi.*1j.*(N(1:1:length(N)).*N(1:1:length(N))') ./ length(N));
