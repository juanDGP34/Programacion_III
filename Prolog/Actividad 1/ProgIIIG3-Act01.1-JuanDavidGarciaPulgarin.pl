%Hechos
nacionalidad(west, estadounidense). 
armas(corea_del_sur, misiles).
vende(west, corea_del_sur). 

%Reglas
criminal(X) :- 
    nacionalidad(X, estadounidense), 
    vende(X, Y), armas(Y, misiles).
