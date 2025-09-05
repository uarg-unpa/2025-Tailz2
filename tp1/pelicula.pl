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

% La nueva regla: actriz_en_pelicula(NombreActriz, TituloPelicula)
% Una actriz actúa en una película si es un actor cuyo sexo es femenino.
actriz_en_pelicula(NombreActriz, TituloPelicula) :- actor(NombreActriz, TituloPelicula), sexo(NombreActriz, femenino).

%Salidas correspondientes (con comentarios):

%Parte 2: Consultas sobre hechos.

% a) ¿Cuáles peliculas dirige Christopher Nolan?
% Consulta: ?director(christopher_nolan, TituloPelicula).
% Prolog me devuelve --> TituloPelicula = interestelar.
% Prolog busca en la base de hechos cualquier término que coincida con el hecho: director(christopher_nolan, TituloPelicula). ENcuentra una coincidencia con director(chirstopher_nolan), unificando la variable TituloPelicula con inception. Cuando se presiona el punto y coma, Prolog busca otra solucion. Entonces, encuentra director(chirstopher_nolan, interestelar), realizando la unificacion TituloPelicula con interestelar. Sigue buscando y al no encontrar más coincidencias, el proceso termina.

% b) ¿Cuáles actúan en películas de ciencia ficción?
% Consulta: ?pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
%Prolog me devuelve --> TituloPelicula = inception, NombreActor = leonardo_dicaprio; TituloPelicula = matrix, NombreActor = keanu_reeves.
%Prolog primero busca el hecho pelicula(TituloPelica, ciencia_ficcion). La primera coincidencia que encuentra es: pelicula(inception, ciencia_ficcion). Entonces se unifica el TituloPelicula con inception. Luego Prolog aprovecha y utilzia este valor en la segunda parte de la consulta, buscando actor(NombreActor, inception). Encuentra la coincidencia actor(leonardo_dicaprio, inception), unificando NombreActor con leonardo_dicaprio, devolviendo la primera solucion.
%Luego cuando presionamos punto y coma, Prolog hace el backtracking, busca otro actor en inception (donde no encuentra ninguno más) y luego regresa al primer predicado para buscar otra pelicula del genero de ciencia ficcion. Encuentra pelicula(matrix, ciencia_ficcion). Esto unifica TituloPelicula con matrix. Entonces busca actor(NombreActor, matrix), encontrando actor(keanu_reeves, matris), y unifica NombreActor con keanu_reeves. Como no existen más soluciones, el proceso finaliza.

% c)Lista todas las peliculas y sus generos.
% Consulta: ?- pelicula(TituloPelicula, Genero). 
%Prolog me devuelve --> 
%TituloPelicula = inception,Genero = ciencia_ficcion ;TituloPelicula = forrest_gump,Genero = drama ;TituloPelicula = jurassic_park,Genero = aventura ;TituloPelicula = titanic,Genero = drama ;TituloPelicula = pulp_fiction,Genero = crimen ;TituloPelicula = el_senor_de_los_anillos,Genero = aventura ;TituloPelicula = matrix,Genero = ciencia_ficcion ;TituloPelicula = gladiador,Genero = epica.
%En este caso, Prolog busca todas las coincidencias para pelicula(TituloPelicula, Genero) y realiza la lista de cada una, unificando las variables con los argumentos correspondientes en cada hecho.

% d)¿Hay algún actor que actúe en Inception y en otra película? 
% Consulta:?-actor(NombreActor,inception),actor(NombreActor,OtraPelicula), OtraPelicula\= inception. 
%Prolog me devuelve --> OtraPelicula = titanic.
%La consulta busca un NombreActor que actúe en inception. Prolog encuentra actor(leonardo_dicaprio, inception). Luego, busca si este mismo actor actúa en otra película (actor(leonardo_dicaprio, OtraPelicula)) y encuentra actor(leonardo_dicaprio, titanic). La última condición, OtraPelicula \= inception, comprueba que titanic es diferente de inception, lo cual es verdadero. Por lo tanto, se encuentra una solución. No hay más actores en inception, por lo que el proceso termina.

%Consultas propias de la Parte 2:
% e)¿Qué directores han dirigido a Tom Hanks?
% Consulta: ?- director(NombreDirector, TituloPelicula), actor(tom_hanks, TituloPelicula).
%Prolog me devuelve --> false.
%Esta consulta busca un NombreDirector que haya dirigido una película en la que también actúe Tom Hanks. Prolog intenta unificar el TituloPelicula en ambos predicados para encontrar una coincidencia. Primero, busca un director y una película, por ejemplo, director(christopher_nolan, inception). Luego, verifica si actor(tom_hanks, inception) es cierto. Como no lo es, retrocede y busca la siguiente pareja de director-película.
%Continúa este proceso de backtracking hasta que encuentra un TituloPelicula que satisface ambos predicados. En la base de hechos, no hay ningún director que haya dirigido una película en la que actúe Tom Hanks (Tom Hanks solo está asociado con "Forrest Gump" y "Cast Away", que no tienen un director definido en la base). Por lo tanto, la consulta no encuentra ninguna solución.

% f)¿Existe alguna película que tenga los géneros de aventura y ciencia ficción?
% Consulta: ?-pelicula(TituloPelicula, aventura), pelicula(TituloPelicula, ciencia_ficcion).
%Prolog me devuelve --> false.
%La consulta busca una película cuyo título (TituloPelicula) pueda ser unificado con un hecho de género aventura y, al mismo tiempo, con un hecho de género ciencia_ficcion. Prolog toma el primer hecho pelicula(jurassic_park, aventura) y lo une a TituloPelicula. Luego, busca si pelicula(jurassic_park, ciencia_ficcion) existe. Como no es el caso, hace backtracking y busca la siguiente película de aventura, que es "El Señor de los Anillos". Intenta verificar si pelicula(el_senor_de_los_anillos, ciencia_ficcion) es cierto y nos devuelve un false (que significa que no se cumple).
% Como no encuentra más películas que cumplan ambos géneros simultáneamente, Prolog no puede satisfacer la consulta, lo cual tiene sentido, ya que en la base de datos una película tiene un solo género.

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
%Punto 1:
%Prolog resuelve este tipo de consultas complejas por medio de dos mecanismos: chaining y backtracking.
%Cuando se ejecuta la consulta, Prolog procesa el primer objetivo: pelicula(TituloPelicula, ciencia_ficcion). Recorre la base de hechos en busca de una coincidencia. Encuentra pelicula(inception, ciencia_ficcion), lo que provoca una unificación: la variable TituloPelicula se une a inception. Con esta unificación, Prolog avanza al siguiente objetivo de la consulta, actor(NombreActor, TituloPelicula), que ahora se trata como actor(NombreActor, inception).
%Prolog busca ahora en su base de datos un hecho que sea similar con actor(NombreActor, inception). Encuentra actor(leonardo_dicaprio, inception) y unifica NombreActor con leonardo_dicaprio. Como se han resuelto todos los objetivos de la consulta, Prolog devuelve la primera solución (NombreActor = leonardo_dicaprio).
%Si se solicita otra solución , Prolog realiza el backtracking, retrocediendo al último objetivo resuelto, actor(NombreActor, inception), y busca otra coincidencia. Al no encontrar más actores en inception, retrocede al objetivo anterior: pelicula(TituloPelicula, ciencia_ficcion). Continúa la búsqueda desde la última coincidencia (inception) y encuentra pelicula(matrix, ciencia_ficcion). Esto genera una nueva unificación, con TituloPelicula ahora unida a matrix. El proceso se repite: Prolog avanza al siguiente objetivo, buscando actor(NombreActor, matrix). Encuentra actor(keanu_reeves, matrix), unifica NombreActor con keanu_reeves y devuelve la segunda solución. Al no haber más coincidencias para ninguno de los objetivos, el proceso termina.

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