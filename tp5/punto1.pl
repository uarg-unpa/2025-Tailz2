%1. Escribir un programa que a partir de una lista de hechos los incorpore a la base de conocimiento.
%Lista de hechos: [hechos (a,b), hechos(x,z), hechos(y,w)].
%:-dynamic(lista/2)
%[x|z] ==> X: cabeza y Z: resto de la lista
%agregar
:-dynamic lista/2.

agregar([]).
%Añadir/agregar lista de hechos
agregar([X|Z]):-
    assert(X), %Agrega el primer hecho en la cabeza
    agregar(Z). %Agrego el resto de la lista

%Salida:
%?- agregar([lista(a,b), lista(6,7), lista(j,n)]).
%true.

%?- listing.

%agregar([]).
%agregar([X|Z]) :-
    %assert(X),
    %agregar(Z).

%:- dynamic resource/3.
%:- multifile resource/3.


%:- dynamic lista/2.

%lista(a, b).
%lista(6, 7).
%lista(j, n).
%true.