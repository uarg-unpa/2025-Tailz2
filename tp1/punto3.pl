%Base de Hechos
vuelo(1, toronto, montreal, 1200, 1300, 42).
vuelo(2, paris, toronto, 1400, 1525, 245).
vuelo(3, toronto, otawa, 1345, 1500, 234).
vuelo(4, vancuver, roma, 920, 1100, 51).
vuelo(5, montreal, mexico, 1030, 1250, 58).

%a) Vuelos que salen de París
%?- vuelo(N, paris, Destino, HoraSalida, HoraArribo, Plazas).

%b) Vuelos que arriban a Toronto
%?- vuelo(N, Origen, toronto, HoraSalida, HoraArribo, Plazas).

%c) Vuelos que parten de Toronto después de las 12:30 hs
%?- vuelo(N, toronto, Destino, HoraSalida, HoraArribo, Plazas), HoraSalida > 1230.

%d) Vuelos que tienen más de 100 plazas
%?- vuelo(N, Origen, Destino, HoraSalida, HoraArribo, Plazas), Plazas > 100.

%e) Vuelos de duración mayor a dos horas

%Para calcular duración, restamos hora de arribo – salida. Ojo: como están en formato HHMM, no es tan directo. Simplificado:

%duracion(HS, HA, D) :- 
    %SH is HS // 100, SM is HS mod 100,
    %AH is HA // 100, AM is HA mod 100,
    %MinSalida is SH*60 + SM,
    %MinArribo is AH*60 + AM,
    %D is MinArribo - MinSalida.

%?- vuelo(N, O, D, HS, HA, P), duracion(HS, HA, Dur), Dur > 120.

%f) Posibles conexiones

%Una conexión existe si el destino de un vuelo coincide con el origen de otro.

%conexion(N1, N2) :-
    %vuelo(N1, Origen, Destino, HS1, HA1, _),
    %vuelo(N2, Destino, Destino2, HS2, HA2, _),
    %HA1 < HS2.   % llega antes de que salga el otro

%?- conexion(V1, V2).