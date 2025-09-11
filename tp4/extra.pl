%Sumar n veces un numero
%?Sumar_veces(2,4,R).
%Caso base
sumar_veces(0,_,0).
sumar_veces(X,Y,R):- X =\= 0, suma(X,Y,0,0,R).
%caso base
%suma(X,Y,Y,A,A). %cuando y e c sean iguales, termina la operacion.
%otra forma
suma(X,Y,C,A,A):- Y =:= C.
%Caso general
suma(X,Y,C,A,R):- C < Y, A1 is X+A, C1 is C+1, suma(X,Y,C1,A1,R).