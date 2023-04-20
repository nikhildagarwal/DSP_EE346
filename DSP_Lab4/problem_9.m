clear; clc;
dftmat = @(N) exp(-2.*pi.*1j.*(N(1:1:length(N)).*N(1:1:length(N))') ./ length(N));
fileID = fopen('DFT_Matrix_Computation_Output.txt','w');
fprintf(fileID,'%6s %12s %18s %24s %30s\n','N','Tmat','Tdft','Tfft','Error');
sampleSizes = [512 1024 2048 4096];

for i = 1:1:length(sampleSizes)
    yes = sampleSizes(i);
    %Start
    x = nan(1, sampleSizes(i));
    for j = 1:1:sampleSizes(i)
        x(j) = randn;
    end
    
    tic
    A = dftmat(x);
    
    elapsed_time_DFTmatrix = toc;
    disp(elapsed_time_DFTmatrix);

    tic
    newX = x.';
    pX = A .* newX;
    for i = 1:1:sampleSizes(i)
        X(i) = pX(i,1);
    end

    elapsed_time_matrix_form = toc;
    disp(elapsed_time_matrix_form);

    tic
    transform = fft(x);
    elapsed_time_DFT = toc;
    disp(elapsed_time_DFT);

    E = norm(X - x);
    disp("Error: "+E);
    %disp("time elapsed (N = "+sampleSizes(i)+"): "+elapsed_time);
    %End
    Array = [yes;elapsed_time_DFTmatrix;elapsed_time_matrix_form;elapsed_time_DFT;E];
    fprintf(fileID,'%6d %12f %18f %24f %30f\r\n\r\n',Array);
    fprintf(fileID,"\n");
end
fclose(fileID);
