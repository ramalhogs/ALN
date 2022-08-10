function [x,C,P]=Gaussian_Elimination_4(A,b)
  
C=[A,b];  
[n]=size(C,1);
P = eye(n,n)
for j=1:(n-1)
    [valor, numero]= max(abs(C([j:n],j)));
    if j ~= numero then
        numero_troca=numero + j - 1;
        C([j numero_troca],:)=C([numero_troca j],:);
        P([j numero_troca],:)=P([numero_troca j],:);
        end
    for i=(j+1):n
        C(i,j)=C(i,j)/C(j,j);
        C(i,j+1:n+1)=C(i,j+1:n+1)-C(i,j)*C(j,j+1:n+1);
    end
  end
  
x=zeros(n,1);
x(n)=C(n,n+1)/C(n,n);
for i=n-1:-1:1
    x(i)=(C(i,n+1)-C(i,i:n)*x(i:n))/C(i,i);
end
C=C(1:n,1:n);
endfunction






