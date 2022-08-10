function [lambda1,x1,k,n_erro] = Potencia_deslocada_inversa (A,x0,epsilon,alfa,M) 

    k = 0
    x0 = x0/norm(x0);
    n_erro = epsilon + 1;
    
    alfaI = A - alfa * eye(A)
    while k<=M && n_erro >=epsilon
        x1=Gaussian_Elimination_4(alfaI,x0);
        x1 = x1/norm(x1);
        lambda1 = x1' * A * x1;
        if x1' * x0 < 0 then 
            x1 = -x1
        end
        rest = x1 - x0;
        n_erro = norm(rest);
        x0 = x1;
        k = k+1
    end

endfunction
