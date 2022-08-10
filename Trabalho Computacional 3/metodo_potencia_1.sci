function [lambda,x1,k,n_erro] = Metodo_potencia_1(A,x0,epsilon,M)
    k=0;
    [valor, numero]= max(abs(x0));        //Aqui pegamos o valor e coordenada de maior modulo de x0
    x0=x0/x0(numero);
    x1 = A*x0;
    
    n_erro = epsilon + 1 //Obriga a entrar no loop
    while k<=M && n_erro>=epsilon
        [valor, numero] = max(abs(x1));
        lambda = x1(numero);
        x1=x1/lambda;
        rest = x1-x0;
        n_erro = norm(rest,%inf);
        x0 = x1;
        x1=A*x0;
        k=k+1;
    end
endfunction
