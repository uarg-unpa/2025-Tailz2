:-dynamic(producto/3).

%1. Crear la base de conocimientos con al menos 6 productos, asignando nombres, precios y
%categorías (por ejemplo, ‘E’, ‘F’, etc.).

%producto(nombre,precio,categoria).
producto(arroz, 150, e).
producto(fideos, 200, e).
producto(leche, 250, e).
producto(yogurt, 250, g).
producto(azucar, 150, f).
producto(aceite, 400, h).

%2. Implementar un predicado recursivo “aumento_productos” que aplique un aumento del
%5% a todos los productos de la categoría E, actualizando sus precios en la base de hechos
%utilizando retract y assert.


%Caso General: Productos de categoria "e"
aumento_productos:-
    producto(Nombre, Precio, e),
    Precio_Nuevo is Precio * 1.05, % --> Le aplicamos el 5% de aumento
    retract(producto(Nombre, Precio, e)), %%-> Eliminamos el hecho antiguo
    assert(producto(Nombre, Precio_Nuevo, e)), % Agregamos uno nuevo
    write('Producto: '),
    write(Nombre),
    write(' / Precio Nuevo: '),
    write(Precio_Nuevo),
    write(' / Categoria: e'), nl,
    fail. %Voy a forzar el backtracking para analizar otras opciones

%Caso base: Cuando no quedan mas productos por buscar/analizar.
aumento_productos.

%3. Mostrar en pantalla el nombre del producto, su nuevo precio y su categoría. Asegurarse
%de que todos los productos de la categoría E sean actualizados correctamente y que los
%productos de otras categorías queden igual.

%Salidas del 3:
%?-aumento_productos.
%Producto: arroz / Precio Nuevo: 157.5 / Categoria: e
%Producto: fideos / Precio Nuevo: 210.0 / Categoria: e
%Producto: leche / Precio Nuevo: 262.5 / Categoria: e
%true.

%?- producto(N,P,C). Referencias --> N: Nombre, P: Precio y C: Categoria
%N = yogurt,
%P = 250,
%C = g ;
%N = azucar,
%P = 150,
%C = f ;
%N = aceite,
%P = 400,
%C = h ;
%N = arroz,
%P = 157.5,
%C = e ;
%N = fideos,
%P = 210.0,
%C = e ;
%N = leche,
%P = 262.5,
%C = e.