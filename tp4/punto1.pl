%caso base
numeros(X,10).
aleatorio:- X is random(10), numeros(X,1).

%caso general
numeros(X,C):- C < 10, C1 is C+1, X is random(10), write(X), numeros(X,C1).
