%Realizar un programa recursivo que en base a un número imprima por pantalla un triángulo. Por 
%ejemplo si el número es 3 debería imprimir:         
%* 
%** 
%***

:-dynamic(triangulo/1).

% Predicado principal
triangulo(N) :- triangulo(N, 1).

% Caso base: si la fila actual supera a N, se detiene
triangulo(N, I) :- I =< N,
    imprimir_estrellas(I),
    nl,  % salto de línea
    I1 is I + 1,
    triangulo(N, I1).
triangulo(_, I) :- I > 0.  % corte para evitar fallos innecesarios

% Predicado auxiliar para imprimir I estrellas
imprimir_estrellas(0).
imprimir_estrellas(N) :-
    N > 0,
    write('*'),
    N1 is N - 1,
    imprimir_estrellas(N1).


%Salidas
%?- triangulo(3).
%*
%**
%***
%true .