%6. Implementar la relación suma_digitos(N, S), dónde S es la suma de los dígitos del número N.

% Caso base: un solo dígito
suma_digitos(N, N) :-
    N < 10.

% Caso recursivo
suma_digitos(N, S) :-
    N >= 10,
    Digito is N mod 10,
    Resto is N // 10,
    suma_digitos(Resto, SR),
    S is SR + Digito.

%Salida
%?- suma_digitos(987, S).
%S = 24 ;