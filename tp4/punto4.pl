%Realizar un programa recursivo que en base a un número imprima por pantalla un triángulo. Por 
%ejemplo si el número es 3 debería imprimir:         
%* 
%** 
%***

:-dynamic(triangulo/2).

triangulo(N):- triangulo(N,1).

%Caso base: si mi fila en la que me encuentro actualmente supera a N, termima
triangulo(N,I):-
    imprimir_estrella(I), nl,
    I1 is I+1,
    triangulo(N,I1).

triangulo(_,1)