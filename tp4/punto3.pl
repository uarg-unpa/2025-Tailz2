hijo(ana,juan).
hijo(juan,pedro).
hijo(maria,juan).

%Reglas
%a)Relacion ancestro(X,Y) donde X es ancestro de Y
ancestro(X,Y) :- hijo(Y,X).              % Caso base: X es padre/madre de Y
ancestro(X,Y) :- hijo(Y,Z), ancestro(X,Z). % Caso recursivo
%b)Relacion descendiente
descendiente(X,Y) :- hijo(X,Y).                    % Caso base
descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y). % Caso recursivo

%Salidas:

%?- ancestro(pedro,ana).
%true .

%?- ancestro(pedro,maria).
%true .

%?- ancestro(juan,ana).
%true .

%?- descendiente(ana,pedro).
%true .

%?- descendiente(maria,pedro).
%true .