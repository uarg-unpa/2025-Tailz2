hijo(ana,juan).
hijo(juan,pedro).
hijo(maria,juan).

%Reglas
%a)Relacion ancestro(X,Y) donde X es ancestro de Y
ancestro(X,Y) :- hijo(X,Y).
ancestro(X,Y) :-hijo(Y,Z), ancestro(X,Z).
%b)
