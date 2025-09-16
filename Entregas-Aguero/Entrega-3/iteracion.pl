imprimir(1) :-
    random(1, 100, A),
    write(A), nl,
    write('fin'), nl,
    !. % Cut para cortar al final

imprimir(X) :-
    X > 1,
    random(1, 100, A),
    write(A), nl,
    X1 is X - 1,
    imprimir(X1).

%Ejercicio Adicional: Modifica para una tabla de multiplicación recursiva (TP4 ejercicio 2):
%tabla(N, M) que imprima N*1 hasta N*10, usando recursión (caso base M=10).

:- dynamic(tabla/2).
%Caso base --> Cuando M llega a 10, imprime el ultimo numero y finaliza
tabla(N,10):-
    R is N*10,
    write(N),
    write('* 10 = '),
    write(R), nl,
    !.

%Caso general --> Mientras M < 10, se seguira ejecutando
tabla(N,M):-
    M < 10,
    R is N*M,
    write(N),
    write(' * '),
    write(M),
    write(' = '),
    write(R), nl,
    M1 is M+1,
    tabla(N,M1).

%Salidas
%?- imprimir(5).
%59
%17
%53
%89
%80
%fin
%true.

%Explicacion del imprimir(1):
%Esta regla lo que hace es generar un numero aleatorio, imprimiendolo y luego llega a "fin". 
%Cuando llega a imprimir(1), el llamado recursivo termina. Utilizando el cut para no buscar mas soluciones al mismo.

%Ejercicio adicional: En este caso, se relaciono el punto 2 con este mismo, con la diferencia de que se utilizó el cut
%con el fin de finalizar la regla en vez de seguir buscando y realizando el backtracking.

%Salida(Ejercicio Adicional):
%?- tabla(6,1).
%6 * 1 = 6
%6 * 2 = 12
%6 * 3 = 18
%6 * 4 = 24
%6 * 5 = 30
%6 * 6 = 36
%6 * 7 = 42
%6 * 8 = 48
%6 * 9 = 54
%6* 10 = 60
%true.