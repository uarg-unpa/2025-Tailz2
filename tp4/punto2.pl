hijo(ana,juan).
hijo(juan,pedro).
hijo(maria,juan).

%Reglas
%a)Relacion ancestro(X,Y) donde X es ancestro de Y
ancestro(X,Y) :- hijo(X,Y).
ancestro(X,Y) :-hijo(Y,Z), ancestro(X,Z).
%b)Relacion descendiente
descendiente(X,Y) :- hijo(X,Y).                    % Caso base
descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y). % Caso recursivo

