%4. Escribir un programa que extraiga los últimos N caracteres de una lista y los coloque en otra lista
% ultimos_n(+Lista, +N, -Ultimos)
% Devuelve en Ultimos los últimos N elementos de Lista.
ultimos_n(Lista, N, Ultimos) :-
    integer(N), N >= 0,
    length(Ultimos, N),
    append(_, Ultimos, Lista).

%Salidas:
%?- ultimos_n([e,a,c,b,g], 2, R).
%R = [b, g] ;
%?- ultimos_n([1,2,3,4,5],5,R).
%R = [1, 2, 3, 4, 5] ;