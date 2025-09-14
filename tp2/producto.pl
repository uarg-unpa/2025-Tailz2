%Los hechos
%producto(Nombre, Precio).

:-dynamic(producto/2).

producto(laptop, 500). 
producto(celular, 300).
producto(tablet, 150).

clasificar(Producto, Categoria) :-
 producto(Producto, Precio),
 Precio > 500,
 Categoria = caro,
 !. % Cut: No backtrack si caro

clasificar(Producto, Categoria) :-
 producto(Producto, Precio),
 Precio >= 200, Precio =< 500,
 Categoria = medio,
 !. % Cut: No backtrack si medio

clasificar(Producto, Categoria) :-
 producto(Producto, Precio),
 Precio < 200,
 Categoria = barato.

% Caso verdadero: precio < 300
es_oferta(Producto) :-
    producto(Producto, Precio),
    Precio < 300,
    !.   % corta y devuelve true

% Caso falso: falla
es_oferta(_) :-
    !, fail.

%Salidas:
%?-  clasificar(laptop, C). 
%C = medio.

%Lo que sucede si no contiene el cut es que Prolog va a intentar el backtracking hasta encontrar alguna alternativa.
%Al no encontrarla, se obtendra el mismo resultado: C = medio.

%?- es_oferta(tablet).
%true.

%?- es_oferta(laptop).
%false.

%?- es_oferta(celular).
%false.