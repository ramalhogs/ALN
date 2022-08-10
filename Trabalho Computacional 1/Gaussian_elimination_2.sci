function [x, C]=Gaussian_Elimination_2(A, b)
C=[A,b];
[n]=size(C,1);

for j=1:(n-1)  
    if C(j,j) == 0 
        C([j j+1], :) = C([j+1 j], :)
     end    
     
 //O pivo esta na posicao (j,j)
     for i=(j+1):n
    //O elemento C(i,j) eh o elemento na posicao (i,j) of L na decomposicao LU de A
        C(i,j)=C(i,j)/C(j,j);
     //Linha i < Linha i - C(i,j)*Linha j
    //Somente os elementos da diagonal ou acima dela sao computados
    //(aqueles que compoem a matrix U)
        C(i,j+1:n+1)=C(i,j+1:n+1)-C(i,j)*C(j,j+1:n+1);
    end
end
    
x=zeros(n,1);
// Calcula x, sendo Ux=C(1:n,n+1)
x(n)=C(n,n+1)/C(n,n);
for i=n-1:-1:1
     x(i)=(C(i,n+1)-C(i,i:n)*x(i:n))/C(i,i);
end
C=C(1:n,1:n);
endfunction