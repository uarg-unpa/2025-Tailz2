%Escribir un programa recursivo tabla(N) que cuando es llamado produce la multiplicación de la tabla 
%para N. Ejemplo: con N=4, ?- tabla(4). Produce la multiplicación de la tabla para 4, comenzando con 1 
%* 4 y finalizando con 10 * 4. 

:-dynamic(tabla/2).

tabla(N) :- tabla(N,1).

%Caso Base: Cuando llego a 10.
tabla(_,11):- !.

%Caso General (Recursivo)
tabla(N,I) :-
    R is I*N,
    write(I), write(' * '), write(N), write(' = '), writeln(R),
    I1 is I+1,
    tabla(N,I1).

%Salidas
%?- tabla(2).
%1 * 2 = 2
%2 * 2 = 4
%3 * 2 = 6
%4 * 2 = 8
%5 * 2 = 10
%6 * 2 = 12
%7 * 2 = 14
%8 * 2 = 16
%9 * 2 = 18
%10 * 2 = 20
true.