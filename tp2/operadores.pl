%primero operadores aritmeticos
precio_con_impuestos(PrecioBase, Impuesto, Total):-Total is PrecioBase + Impuesto.
precio_con_descuento(PrecioBase, Descuento, Final):- Final is PrecioBase - Descuento.
costo_total(Copias,PrecioUnitario,Total):- Total is Copias * PrecioUnitario.
costo_por_persona(Total, Personas, Costo):- Costo is Total / Personas.
divisible_por_5(Stock):- 0 is Stock mod 5.
area_estante(Lado,Area):- Area is Lado ^ 2.
%operadores de comparacion
