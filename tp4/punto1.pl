% Predicado principal: imprimir 10 números aleatorios
imprimir_10_aleatorios :-
    imprimir_aleatorios(10).

% Caso base: cuando ya imprimió 0, termina
imprimir_aleatorios(0) :- !.

% Caso recursivo: imprime un número y llama con N-1
imprimir_aleatorios(N) :-N > 0, random_between(1, 100, X), writeln(X), N1 is N - 1,
    imprimir_aleatorios(N1).
