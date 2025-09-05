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
actor(kate_winslet, titanic).
actor(cate_blanchett, el_senor_de_los_anillos).

%Hechos de directores - director(NombreDirector, TituloPelicula)
director(chirstopher_nolan, inception).
director(steven_spielberg, jurassic_park).
director(christopher_nolan, interestelar).
director(ridley_scott, gladiador).
director(quentin_tarantino, pulp_fiction).
director(james_cameron, titanic).
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
es_famosa(TituloPelicula) :-director(_, TituloPelicula),actor(_, TituloPelicula).

%Parte 4: Analisis y Extension
% Extensión de la base de hechos con el sexo de los actores
sexo(leonardo_dicaprio, masculino).
sexo(tom_hanks, masculino).
sexo(samuel_l_jackson, masculino).
sexo(john_travolta, masculino).
sexo(keanu_reeves, masculino).
sexo(russell_crowe, masculino).
sexo(cate_blanchett, femenino).
sexo(kate_winslet, femenino).

% Nueva regla: actriz_en_pelicula(NombreActriz, TituloPelicula)
% Una actriz actúa en una película si es un actor cuyo sexo es femenino.
actriz_en_pelicula(NombreActriz, TituloPelicula) :- actor(NombreActriz, TituloPelicula), sexo(NombreActriz, femenino).

%Salidas

%Parte 2: Consultas sobre hechos.

% a) ¿Cuáles peliculas dirige Christopher Nolan?
% Consulta: ?director(christopher_nolan, TituloPelicula).
% Prolog me devuelve --> TituloPelicula = interestelar.
% 
% b) ¿Cuáles actúan en películas de ciencia ficción?
% Consulta: ?pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
%Prolog me devuelve --> TituloPelicula = inception, NombreActor = leonardo_dicaprio; TituloPelicula = matrix, NombreActor = keanu_reeves.

% c)Lista todas las peliculas y sus generos.
% Consulta: ?- pelicula(TituloPelicula, Genero). 
%Prolog me devuelve --> 
%TituloPelicula = inception,Genero = ciencia_ficcion ;TituloPelicula = forrest_gump,Genero = drama ;TituloPelicula = jurassic_park,Genero = aventura ;TituloPelicula = titanic,Genero = drama ;TituloPelicula = pulp_fiction,Genero = crimen ;TituloPelicula = el_senor_de_los_anillos,Genero = aventura ;TituloPelicula = matrix,Genero = ciencia_ficcion ;TituloPelicula = gladiador,Genero = epica.

% d)¿Hay algún actor que actúe en Inception y en otra película? 
% Consulta:?-actor(NombreActor,inception),actor(NombreActor,OtraPelicula), OtraPelicula\= inception. 
%Prolog me devuelve --> OtraPelicula = titanic.

%Consultas propias de la Parte 2:
% e)¿Qué directores han dirigido a Tom Hanks?
% Consulta: ?- director(NombreDirector, TituloPelicula), actor(tom_hanks, TituloPelicula).
%Prolog me devuelve --> false.
% f)¿Existe alguna película que tenga los géneros de aventura y ciencia ficción?
% Consulta: ?-pelicula(TituloPelicula, aventura), pelicula(TituloPelicula, ciencia_ficcion).
%Prolog me devuelve --> false.

%Parte 3: Definir Reglas:
%Consultas para probar las Reglas

%?-actua_en_genero(leonardo_dicaprio, Genero).
%Prolog devuelve --> Genero = ciencia_ficcion; Genero = Drama.

%?colaboracion(leonardo_dicaprio, OtroActor).
%Prolog devuelve --> false. Debido a que no hay actores que colaboren con leonardo di caprio.

%?- colaboracion(samuel_l_jackson, OtroActor).
%Prolog devuelve --> OtroActor = john_travolta.

%Consulta para la regla propia:

%?- es_famosa(jurassic_park).
%Prolog devuelve --> false. Debido a que Prolog no encuentra los hechos que coincida con la regla.

%?- es_famosa(pulp_fiction).
%Prolog devuelve --> true. Debido a que prolog encontró una coincidencia en los hechos con la regla.

%Parte 4: Analisis y Extension
%Punto 2:
%Consultas realizadas para probar el funcionamiento del ejercicio

%¿Qué actrices hay en la pelicula Titanic?
%?- actriz_en_pelicula(Actriz, titanic).
%Prolog devuelve --> Actriz = kate_winslet.

%¿Qué películas tienen a Cate Blanchett como actriz?
%?- actriz_en_pelicula(cate_blanchett, Pelicula).
%Prolog devuelve --> Pelicula = el_senor_de_los_anillos.

%Listar todas las actrices y sus películas
%?- actriz_en_pelicula(Actriz, Pelicula).
%Prolog devuelve --> 
%Actriz = kate_winslet,
%Pelicula = titanic ;
%Actriz = cate_blanchett,
%Pelicula = el_senor_de_los_anillos.

%Verificar si una persona fue actriz en alguna película
%?- actriz_en_pelicula(leonardo_dicaprio, _).
%Prolog devuelve --> false.