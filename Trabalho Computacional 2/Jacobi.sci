function [xk, normadif, nk, normares]=Jacobi(A,b,x0,E,M,tiponorma)
    
    D = diag(diag(A));
    LU = A-D;
    invD = diag(1./diag(A));
    
    Mj=invD*(LU);
    Cj=invD*b;
    
    xk = x0;
    normadif = E;
    nk = 0;
    while normadif >= E && nk<M
        x0=xk;
        xk=-Mj*x0+Cj;
        dif = x0 - xk;
        normadif = norm(dif,tiponorma);
        nk = nk+1;
    end
    
    normares=norm(A*xk-b,tiponorma);
    
endfunction

