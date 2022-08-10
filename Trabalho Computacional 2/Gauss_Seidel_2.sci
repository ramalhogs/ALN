function [xk]=resolve(LD,x)
    n=size(x,1)
    xk = zeros(n,1);
    xk(1)= x(1)/LD(1,1);
    for i =2 : n
        xk(i)=(x(i)-LD(i,:)*xk)/LD(i,i);
    end
endfunction

function [xk, normadif, nk, normares]=Gauss_Seidel_2(A,b,x0,E,M,tiponorma)
    
    L = tril(A);
    U = A-L;
    
    xk = x0;
    normadif = E;
    nk = 0;
    while normadif >= E && nk<M
        x0=xk;
        xmedio = -(U*x0) + b;
        xk=resolve(L,xmedio);
        dif = x0 - xk;
        normadif = norm(dif,tiponorma);
        nk = nk+1;
    end
    
    normares=norm(b - A*xk,tiponorma); 
endfunction
