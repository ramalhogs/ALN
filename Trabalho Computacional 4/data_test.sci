function [x,accuracy,y] = cancer(TestM, Testb)
    
    cancer_train = csvRead("cancer_train.csv")  //importo o arquivo de treino
    TrainM = cancer_train(:,1:10)
    Trainb = cancer_train(:, 11)
    
    [i j] = size(TrainM) //capturando tamanho de M treino
    A = [ones(i, 1), TrainM]  //Criando a matriz A Treino
    
    [x]=Gaussian_Elimination_4(A' * A, A' * Trainb)   //Encontrando Xi
    
    [n m] = size(TestM) //Capturando tamanho de M teste
    Atest = [ones(n, 1), TestM]  //Criando A teste
    y = Atest * x  //Conferindo os valores com Xi
    
    comp = y.*Testb  //Conferindo se o sinal (+ ou -) bate

    acertos = comp>=0
    accuracy = sum(acertos)/n  //calculando acuracia
endfunction
