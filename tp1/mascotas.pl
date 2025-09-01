%base de hechos
mascota(perro,fido).
mascota(gato, whiskers).
mascota(pedro, rex).
dueño(juan, fido).
dueño(ana, whiskers).
dueño(pedro, rex).
color(fido, marron).
color(wiskers, gris).
color(rex, negro).
dueño(juan, canario).
%mascota(Tipo,whiskers). % devuelve tipo = gato.
%mascota(perro, Nombre) %devuelve nombre = fido.
%color(rex, Color) % devuelve color = negro
%mascota(gato, Nombre), dueño (Dueño, Nombre).
%mascota_color(Color, Mascota):- color(Mascota, Color). Regla Simple