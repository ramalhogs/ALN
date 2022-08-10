function [tempo]=tempoexecucao(tam)
    x0 = ceil(10*rand(tam,1));
    A = ceil(10*rand(tam,tam));
    for j= 1 : tam
        A(j,j)=1+sum(abs(A(j,:)));
    end
    x=zeros(tam,1);
    tic();
    
    [lambda,k,n_erro] = Metodo_potencia_1(A,x0,0.0000000001,300)
    t1 = toc();
    tic();
    [lambda,k1,n_erro] = Metodo_potencia_2(A,x0,0.0000000001,300)
    t2 = toc();
    tempo =[t1,t2];
endfunction
    
