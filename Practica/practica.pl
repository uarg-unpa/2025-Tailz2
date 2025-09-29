%Ejemplo completo en Prolog aplcando : hechos, reglas, consultas, unificación, recursión, backtracking y listas.

%Ejemplo: Una base de conocimiento de personas, comidas y gustos
%1. Hechos
% Personas
%persona(juan).
%persona(maria).
%persona(pedro).

% Comidas
%comida(pizza).
%comida(hamburguesa).
%comida(ensalada).

% Quién come qué
%gusta(juan,pizza).
%gusta(maria,ensalada).
%gusta(pedro,pizza).
%gusta(pedro,hamburguesa).

%2. Reglas
% Una persona es saludable si le gusta la ensalada
%saludable(X) :- gusta(X,ensalada).

% Dos personas son amigos si les gusta la misma comida
%amigos(X,Y) :- gusta(X,Comida), gusta(Y,Comida), X \= Y.

%3. Consultas (ejemplos)
%?- saludable(maria).
%true.

%?- saludable(juan).
%false.

%?- amigos(juan,Y).
%Y = pedro.     % porque ambos comen pizza


A%quí se ve backtracking, porque Prolog va probando diferentes valores de Y.

%4. Unificación
%?- gusta(pedro,Comida).
%Comida = pizza ;
%Comida = hamburguesa.


%La variable Comida se unifica con todas las comidas que le gustan a Pedro.

5%. Recursividad con listas

%Ahora usamos listas para hacer algo más interesante: calcular la longitud de una lista de comidas que le gustan a alguien.

% longitud de una lista
%longitud([],0).
%longitud([_|T],N) :- longitud(T,N1), N is N1+1.

% obtener todas las comidas que le gustan a una persona en una lista
%gustos_persona(P,L) :- findall(C, gusta(P,C), L).

%6. Ejemplo práctico con listas, recursión y consultas
%?- gustos_persona(pedro,L).
%L = [pizza, hamburguesa].

%?- gustos_persona(pedro,L), longitud(L,N).
%L = [pizza, hamburguesa],
%N = 2.