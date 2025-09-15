%Las reglas tienen dos partes: la cabeza y el cuerpo
%La recursividad tiene dos casos: Caso Base (Indica hasta donde termina) y Caso General (las llamadas)
%Arboles
:- dynamic(nodo/3).
%Baso de conocimiento
nodo(7,4,8).
nodo(4,2,9).
nodo(2,nil,nil).
nodo(9,nil,nil).
nodo(8,5,1).
nodo(5,nil,nil).
nodo(1,6,nil).
nodo(6,nil,nil).
%Representacion del Arbol
                                        %7
                                    %4      %8
                                %2    %9  %5  %1
                                                %6
%Preorden: R - HI - HD --> 7 4 2 9 8 5 1 6
%Inorden: HI - R - HD
%PosOrden: HI - HD - R

%Reglas
%Caso Base
preorden(nil):- !.
%Caso General
preorden(R):- write(R), nodo(R,HI,HD), preorden(HI), preorden(HD).
%7 4 2 9 8 5 1 6 --> Recorrido Preorden

%?-preorden(7).

%Caso Base
inorden(nil):- !.
%Caso General
inorden(R):- nodo(R,HI,HD), inorden(HI), write(R), inorden(HD).
%2 4 9 7 5 8 1 6 --> Recorrido Inorden

%Caso Base
posorden(nil):- !.
%Caso General
posorden(R):- nodo(R,HI,HD), posorden(HI), posorden(HD), write(R).
%2 9 4 5 6 1 8 7 --> Recorrido Posorden

%Mayor (Mostrar el elemento mayor del arbol)

% Caso base: si el nodo no tiene hijo derecho, ese es el mayor
mayor(R) :- nodo(R, _, nil), write(R), !.

% Caso general: seguir buscando en el hijo derecho
mayor(R) :- nodo(R, _, HD), mayor(HD).


%Salidas
%?- preorden(7).
%74298516
%true.

%?- inorden(7).
%24975861
%true.

%?- posorden(7).
%29456187
%true.

%?- mayor(7).
%6.
%true.