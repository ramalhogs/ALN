function [x] = minimos_quadrados()
    
    CD = csvRead("cobbdouglas.csv")
    
    P = CD(:,2)   //Aqui, pego as colunas do meu arquivo que representam P, L e K
    L = CD(:,3)
    K = CD(:,4)
    
    vec = log(L./K)     
   
    A = [ones(vec), vec]  //Aqui eu gero A e b, da forma que expliquei anteriormente
    b = [log(P./K)]
    
    Al = A' * A
    Bl = A' * b
    
    [x]=Gaussian_Elimination_4(Al,Bl)
    
endfunction
