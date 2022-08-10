function [xk, normadif, nk, normares]=Gauss_Seidel_1(A,b,x0,E,M,tiponorma)
    
    LD = tril(A);
    U = A-LD;
    invLD = inv(LD);
    
    Mgs=-(invLD*(U));
    Cgs=invLD*b;
    
    xk = x0;
    normadif = E;
    nk = 0;
    while normadif >= E && nk<M
        x0=xk;
        xk=-Mgs*x0+Cgs;
        dif = x0 - xk;
        normadif = norm(dif,tiponorma);
        nk = nk+1;
    end
    
    normares=norm(A*xk-b,tiponorma);
    
endfunction
