function [Q,R]=qr_GSM(A)

m = size(A,1);
n = size(A,2); 
Q = eye(m,n);
R = eye(n,n);

for j=1:n
    a_j = A(:,j); 
    v = a_j; 
    for i=1:j-1 
        q_i = Q(:,i); 
        r_ij = q_i' * v; 
        R(i,j) = r_ij; 
        v = v - r_ij * q_i; 
    end
    r_jj = norm(v); 
    R(j,j) = r_jj; 
    q_j = v / r_jj;
    Q(:,j) = q_j; 
    
end

endfunction
