function [U,R]=qr_House(A)

m = size(A,1);
n = size(A,2);
U = zeros(m,n);
R = eye(m,n);

for k=1:n 
    x = A(k:m,k); 
    if x(1) < 0 then 
        x(1) = x(1) - norm(x);
    else 
        x(1) = x(1) + norm(x);
    end
    u = x / norm(x);
    U(k:m,k) = u; 
    A(k:m,k:n) = A(k:m,k:n) - 2 * u * (u' * A(k:m,k:n));
end

R = triu(A);

endfunction
