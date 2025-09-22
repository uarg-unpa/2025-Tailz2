%2. Escribir un programa que cuente el número de ocurrencias de un carácter en una lista de caracteres.
%La llamada sería:
%?- ocurrencia(X,C,N).
%Donde N es el número de ocurrencias del carácter C en la lista X.
%Explique cómo puede ser usado para determinar si una lista tiene exactamente 3 ocurrencias del carácter
%'a'

%ocurrencia(X,C,N).
%Condicion de caso base
ocurrencia([], C, 0).

%si la lista (elemento cabeza) y X(caracter) son iguales
ocurrencia([X|Z],X,N):-
    N is R+1,
    ocurrencia(Z,C,R).

ocurrencia([X|Z],C,N):-
    ocurrencia(Z,C,N).
