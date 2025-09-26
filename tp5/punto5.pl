% 5. Escribir un programa que substraiga una lista de otra lista. Asuma la siguiente llamada:
 %?- sustraer(X,Y,Z).
 %Donde Z resulta de la sustracción de X a Y. La sustracción de una lista de otra lista consiste en remover
 %todos los elementos de X que están en Y. Por ej. El resultado de sustraer [a,b] de [e,a,c,b,g] es [e,c,g].
%Caso Base
eliminar_todos(_, [], []).
%Caso General
eliminar_todos(Elem, [Elem|T], R):-
    eliminar_todos(Elem, T, R).
eliminar_todos(Elem, [H|T],[H|R]) :-
    H \= Elem,
    eliminar_todos(Elem, T, R).

%Sustraer (X,Y,Z)
%Zes Y con todos los elementos removidos que aparecen en X.
sustraer([],Y,Y).
sustraer([H|T], Y, Z):-
    eliminar_todos(H,Y,Y1),
    sustraer(T,Y1,Z).

%Salida:
%?- sustraer([a,b], [e,a,c,b,g], Z).
%Z = [e, c, g] .

%?-  sustraer([x,y], [x,x,a,y,b,y], Z).
%Z = [a, b] .

