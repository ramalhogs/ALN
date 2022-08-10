function [Q]=constroi_Q_House(U)

m = size(U,1);
n = size(U,2); 
u_1 = U(:,1); 
Q = eye(m,m) - 2 * u_1 * u_1'; 

for k=2:n 
    u_k = U(:,k);
    Q_k = eye(m,m) - 2 * u_k * u_k'; 
    Q = Q * Q_k;
end

endfunction
