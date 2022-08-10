function [tempo]=tempoexecucao(tam)
    b = ceil(10*rand(tam,1));
    A = ceil(10*rand(tam,tam));
    for j= 1 : tam
        A(j,j)=1+sum(abs(A(j,:)));
    end
    x=zeros(tam,1);
    tic();
    
    [xk, ndif, k, nres] = Gauss_Seidel_1(A,b,x,0.000001,300,2);
    t1 = toc();
    tic();
    [xk, ndif, k1, nres] = Gauss_Seidel_2(A,b,x,0.000001,300,2);
    t2 = toc();
    tempo =[t1,t2,k,k1];
endfunction
    
