%6. Escribir un programa que concatene dos listas X e Y y coloque el resultado en una lista Z. Si X e Y tienen elementos comunes, estos elementos aparecen solo una vez en Z. Asuma que X e Y, tomados separadamente, no contienen elementos duplicados.
% pertenece(+Elem, +Lista)
% Verdadero si Elem está en Lista (definido recursivamente, sin usar member/2).
pertenece(E, [E|_]).
pertenece(E, [_|T]) :-
    pertenece(E, T).

% concat_sin_repetir(+X, +Y, -Z)
% Concatena X e Y en Z sin repetir elementos comunes.
concat_sin_repetir([], Y, Y).
concat_sin_repetir([H|T], Y, [H|Z]) :-
    \+ pertenece(H, Y),              % H no está en Y
    concat_sin_repetir(T, Y, Z).
concat_sin_repetir([H|T], Y, Z) :-
    pertenece(H, Y),                 % H ya aparece en Y
    concat_sin_repetir(T, Y, Z).

%Salidas:
%?- concat_sin_repetir([a,b,c], [c,d,e], Z).
%Z = [a, b, c, d, e] .

%?- concat_sin_repetir([1,2], [3,4], Z).
%Z = [1, 2, 3, 4] .

%?- concat_sin_repetir([x,y], [y,z], Z).
%Z = [x, y, z] .