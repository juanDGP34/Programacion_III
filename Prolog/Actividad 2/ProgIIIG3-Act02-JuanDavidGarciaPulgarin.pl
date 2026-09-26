%Hechos
conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(edmonton, saskatoon, 12).
conexion(saskatoon, winnipeg, 20).
conexion(calgary, edmonton, 4).
conexion(saskatoon, calgary, 9).
conexion(calgary, regina, 14).
conexion(regina, saskatoon, 7).
conexion(regina, winnipeg, 4).

%Reglas
%------------------------------------
tiene_aristas(X) :- 
    conexion(X,_,_).

%Consultas
%?- tiene_aristas(X).
%------------------------------------

%------------------------------------
viajar(X,Y) :- 
    conexion(X,Y,_).
viajar(X,Y) :- 
    conexion(X,Z,_), 
    viajar(Z,Y).

%Consultas
%?- viajar(saskatoon, vancouver).
%------------------------------------

%------------------------------------
viajarCosto(X,Y,COSTO) :- 
    conexion(X,Y,COSTO).
viajarCosto(X,Y,COSTO) :-
    conexion(X,Z,COSTO1),
    viajarCosto(Z,Y,COSTO2),
    COSTO is COSTO1 + COSTO2.

%Consultas
%?- viajar(regina,Y,COSTO).
%?- viajar(X,Y, COSTO).
%------------------------------------

%------------------------------------
%Version limitada de viajarCosto
costo(X,Z,Y, COSTO) :- 
    conexion(X,Y, COSTO1), 
    conexion(Y,Z, COSTO2), 
    COSTO is COSTO1+COSTO2.
%------------------------------------
