%primero operadores aritmeticos
precio_con_impuestos(PrecioBase, Impuesto, Total):-Total is PrecioBase + Impuesto.
precio_con_descuento(PrecioBase, Descuento, Final):- Final is PrecioBase - Descuento.