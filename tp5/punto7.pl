%7. Escribir el programa "pertenece" que indique si un elemento pertenece a la lista y devuelva la posición ocupada por el elemento.

%pertenece (Elem, Lista, Pos)
%Verdadero si Elem se encuentra en la Lista en la posicion Pos (comienza en 1)

%Caso base:El primero coincide
pertenece(Elem, [Elem|_], 1).

%Caso Recursivo:
pertenece(Elem, [_|T], Pos):-
    pertenece(Elem, T, Pos1),
    Pos is Pos1 + 1.

%Salidas:
%?- pertenece(a, [e,a,c,b,g], Pos).
%Pos = 2.

%?- pertenece(c, [e,a,c,b,g], Pos).
%Pos = 3.

%?- pertenece(x, [e,a,c,b,g], Pos).
%false.
