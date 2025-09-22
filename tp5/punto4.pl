%4. Escribir un programa que extraiga los últimos N caracteres de una lista y los coloque en otra lista
ultimo(N,Lista,Lista):-
    contar(Lista,N).

ultimo(N,[_|T],SubLista):-
    ultimo(N,T,Sublista).

contar([], 0).
contar([_|T], N):-
    N > 0,
    N1 is N-1,
    contar(T, N1).