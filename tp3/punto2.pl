% Punto 2
presidencia(raul_alfonsin, 1983, 1989).
presidencia(carlos_menem, 1989, 1999).
presidencia(fernando_de_la_rua, 1999, 2001).
presidencia(adolfo_rodriguez_saa, 2001, 2001).
presidencia(eduardo_duhalde, 2002, 2003).
presidencia(nestor_kirchner, 2003, 2007).
presidencia(cristina_fernandez_de_kirchner, 2007, 2015).
presidencia(mauricio_macri, 2015, 2019).
presidencia(alberto_fernandez, 2019, 2023).

% Regla
fue_presidente(X,Y) :- presidencia(X, Ai, Af), Y >= Ai, Y =< Af.