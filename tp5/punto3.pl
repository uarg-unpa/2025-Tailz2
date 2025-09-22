%3. Escribir un programa que extraiga los primeros N caracteres de una lista y los coloque en otra lista

:-dynamic(extraer/3).
extraer(0, _, []) :- !. %Caso Base
extraer(_, [], []) :- !. %Caso Base.
extraer(N, [H|T], [H|R]) :-
    N > 0,
    N1 is N - 1,
    extraer(N1, T, R).
