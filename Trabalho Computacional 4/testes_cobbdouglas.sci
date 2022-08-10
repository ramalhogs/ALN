function [P] = testes_cobbdouglas(L, K, alpha, beta)
    P = beta * L.^(alpha) * K.^(1 - alpha)
endfunction
