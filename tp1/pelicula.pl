%Parte 1:
%Base de hechos de Peliculas, los actores y los directores

pelicula(inception,ciencia_ficcion).
pelicula(forrest_gump,drama).
pelicula(jurassic_park,aventura).
pelicula(titanic,drama).
pelicula(pulp_fiction,crimen).
pelicula(el_senor_de_los_anillos, aventura).
pelicula(matrix,ciencia_ficcion).
pelicula(gladiador,epica).

%Hechos de actores - actor(NombreActor, TituloPelicula)
actor(leonardo_dicaprio, inception).
actor(tom_hanks, forrest_gump).
actor(leonardo_dicaprio, titanic).
actor(tom_hanks, cast_away). %cast away: Naufrago (2000)
actor(samuel_l_jackson, pulp_fiction).
actor(john_travolta, pulp_fiction).
actor(keanu_reeves, matrix).
actor(russel_crowe, gladiador).

%Hechos de directores - director(NombreDirector, TituloPelicula)
director(chirstopher_nolan, inception).
director(steven_spielberg, jurassic_park).
director(christopher_nolan, interestelar).
director(ridley_scott, gladiador).
director(quentin_tarantino, pulp_fiction).
director(peter_jackson, el_senor_de_los_anillos).

%Parte 3: Reglas

%a) actua_en_genero(NombreActor, Genero)
% Lo que hace es que un actor actue en un género si en la pelicula que
% actua coincide con el genero.
actua_en_genero(NombreActor, Genero) :- actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, Genero).
%b colaboracion(NombreActor1, NombreActor2)
% Ambos actores colaboran si actuan en la misma pelicula, pero no son la misma persona.
colaboracion(NombreActor1, NombreActor2) :-actor(NombreActor1, TituloPelicula),actor(NombreActor2, TituloPelicula),NombreActor1 \= NombreActor2.

%c) director_de_genero(NombreDirector, Genero):
% Un director dirige en un genero si dirige una pelicula cuyo generocoincidedirector_de_genero(NombreDirector, Genero) :- director(NombreDirector, TituloPelicula), pelicula (TituloPelicula, Genero).
director_de_genero(NombreDirector, Genero) :- director(NombreDirector, TituloPelicula),pelicula(TituloPelicula, Genero).

% d) pelicula_con_colaboracion(TituloPelicula): Una pelicula
% tiene colaboración si hay al menos dos actores distintos que actúan en
% ella.
pelicula_con_colaboracion(TituloPelicula) :-actor(NombreActor1, TituloPelicula),actor(NombreActor2, TituloPelicula),NombreActor1 \= NombreActor2.
% Regla propia: es_famosa(TituloPelicula)
% Una película es famosa si tiene un director y al menos un actor.
es_famosa(TituloPelicula) :- director(_NombreDirector, TituloPelicula), actor(_NombreActor, TituloPelicula).
