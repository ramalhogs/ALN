function [S] = espectro(A, tol)

[Q_inicial,R_inicial]=qr_GSM(A);
A_prox = R_inicial * Q_inicial;
e = norm(diag(A_prox) - diag(A), %inf);

while e > tol
    A = A_prox;
    [Q_prox,R_prox]=qr_GSM(A); 
    A_prox = R_prox * Q_prox; 
    e = norm(diag(A_prox) - diag(A), %inf); 
end

S = diag(A_prox); 
endfunction
