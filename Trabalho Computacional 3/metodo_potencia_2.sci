function [lambda,x1,k,n_erro] = Metodo_potencia_2(A,x0,epsilon,M)
    k=0;
    x0=x0/norm(x0);
    x1 = A*x0;                      //aproximação do autovetor dominante
    n_erro = epsilon + 1            //Obriga a entrar no loop
    while k<=M & n_erro >=epsilon
        lambda = x1'*x0;          //Quociente de Rayleigh; x0 é unitario
        if lambda<0 then          //Mantem x1 com mesmo sentido de x0
            x1=-x1;
        end
        x1=x1/norm(x1);
        rest = x1-x0;
        n_erro = norm(rest);
        x0 = x1;
        x1=A*x0;
        k=k+1;
    end
   
endfunction
