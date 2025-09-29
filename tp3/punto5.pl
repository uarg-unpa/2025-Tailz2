% Punto 5 : Regla
baskara(A,B,C,X1, X2) :- Aux is ((B*B) - (4*A*C)), sqrt(Aux, Result), X1 is ((-B + Result)/(2*A)), X2 is ((-B - Result)/(2*A)).