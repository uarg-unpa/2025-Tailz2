%segundo hechos
precio(el_principito, 60).
precio(harry_potter, 45).
stock(el_principito, 10).
stock(harry_potter, 3).
stock(el_principito,10).

libro_disponible_caro(Titulo, Precio, Stock) :- stock(Titulo, Stock), Precio > 50.

clasificar_libro(Precio, Categoria) :- Precio > 50, Categoria = caro.
clasificar_libro(Precio, Categoria) :- Precio =< 50, Categoria = economico.

pelicula(inception, ficcion). pelicula(gump,drama).
generos_diferentes(T1,T2) :- pelicula(T1, G1), pelicula(T2,G2), G1 \= G2.

%Negacion por fallo
sin_stock(Titulo):- \+ stock(Titulo,_).

% tercero: declarar predicados dinamicos
%:- dynamic nombre_predicado /aridad
:-dynamic libro/2.
:-dynamic prestado/2.


libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").

%Regla: Un libro esta disponible si no esta prestado
disponible(Titulo):- libro(Titulo,_), \+ prestado(Titulo, _).

% Regla: Un libro está disponible si no está prestado
disponible(Titulo) :- libro(Titulo, _), \+ prestado(Titulo, _).

% Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo, Autor) :- assertz(libro(Titulo, Autor)).

% Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo, Autor) :- asserta(libro(Titulo, Autor)).

%Consulta para ver todos los libros
listar_libros :- libro(Titulo, Autor), write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Procedimiento para registrar un préstamo
prestar(Titulo, Persona) :- disponible(Titulo), assertz(prestado(Titulo, Persona)).

eliminar_libro(Titulo) :-
 libro(Titulo, _),
 \+ prestado(Titulo, _),
 retract(libro(Titulo, _)),
 write('Libro eliminado: '), write(Titulo), nl.

eliminar_libro(Titulo) :-
 prestado(Titulo, _),
 write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,
 fail. % Fuerza fracaso si está prestado
 
eliminar_libro(Titulo) :-
 \+ libro(Titulo, _),
 write('Error: Libro '), write(Titulo), write(' no existe.'), nl,
 fail. % Fuerza fracaso si no existe

eliminar_prestamo(Titulo):- 
    retract(prestamo(Titulo,_)), 
    write("Prestamo eliminado: "), 
    write(Titulo), nl, !.

eliminar_prestamo(Titulo):-
    write("No existe prestamo con el titulo"),
    write(Titulo), nl.

%Salidas

%1) Basicamente se necesita el dynamic porque nos permite modificarlo en tiempo de ejecucion, de lo contrario, Prolog lo va a tratar como estático.
%2)
%?-eliminar_libro("1984").
%Libro eliminado: 1984

%?- eliminar_libro("el_principito").
%Error: Libro el_principito está prestado.
%false.

%?- eliminar_prestamo("el_principito").
%No existe prestamo con el tituloel_principito
%true.