function[X] = Resolve_Com_LU(P, C, B)
    
    [t] = size(C,1);
    ident = eye(t,t)
    
    L = tril(C, -1) + ident;
    U = triu(C);
    X =[];
    
    [SC] = size(B,2);
    
    Z = (P')*L*U;

    
    for j=1:SC
        b = B(:,j);
        x = inv(Z)*b;
        X = [X x];
    end

endfunction
