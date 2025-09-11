aleatorio:- numeros(1).
%caso base
numeros(10):- X is random(10), write(X).
%caso general
numeros(C):- C < 10, X is random(10), write(X), nl, C1 is C+1, numeros(C1).
