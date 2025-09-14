%primero operadores aritmeticos
precio_con_impuestos(PrecioBase, Impuesto, Total):-Total is PrecioBase + Impuesto.
precio_con_descuento(PrecioBase, Descuento, Final):- Final is PrecioBase - Descuento.
costo_total(Copias,PrecioUnitario,Total):- Total is Copias * PrecioUnitario.
costo_por_persona(Total, Personas, Costo):- Costo is Total / Personas.
divisible_por_5(Stock):- 0 is Stock mod 5.
area_estante(Lado,Area):- Area is Lado ^ 2.
es_par(Par) :- 0 is Par mod 2.
%operadores de comparacion
es_caro(Precio):- Precio > 50.
es_barato(Precio):- Precio < 30.
apto_promocion(Stock) :- Stock >= 10.
bajo_stock(Stock) :- Stock =< 5.
precio_correcto(Precio, Base, Imp) :- Precio =:= Base + Imp.
precios_distintos(Precio1, Precio2) :- Precio1 =\= Precio2.
