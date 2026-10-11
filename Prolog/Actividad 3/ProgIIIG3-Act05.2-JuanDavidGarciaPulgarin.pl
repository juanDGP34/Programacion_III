%Hechos
conexiones([
           conexion(vancouver, edmonton, 16),
           conexion(vancouver, calgary, 13),
           conexion(edmonton, saskatoon, 12),
           conexion(saskatoon, winnipeg, 20),
           conexion(calgary, edmonton, 4),
           conexion(saskatoon, calgary, 9),
           conexion(calgary, regina, 14),
           conexion(regina, saskatoon, 7),
           conexion(regina, winnipeg, 4)
]).

%Reglas
%------------------------------------

estaConectado(X, [conexion(X,_,_)|_]).

estaConectado(X, [_|Cola]) :-
    estaConectado(X, Cola).

tieneAristas1(X) :- 
    conexiones(LS),
	estaConectado(X, LS).

tieneAristas2(X, LS) :- 
	estaConectado(X, LS).

%Consultas
%?- tiene_aristas(X).
%------------------------------------

viajar1(CIUDAD_A, CIUDAD_B, LS) :-
    member(conexion(CIUDAD_A, CIUDAD_B, _), LS).

viajar1(CIUDAD_A, CIUDAD_B, LS) :-
    member(conexion(CIUDAD_A, CIUDAD_X, _), LS),
    viajar1(CIUDAD_X,CIUDAD_B, LS).

viajar2(CIUDAD_A,CIUDAD_B, [conexion(CIUDAD_A,CIUDAD_B,_)|_]).

viajar2(CIUDAD_A, CIUDAD_B, [_ | Cola]) :-
    viajar1(CIUDAD_A, CIUDAD_B, Cola).

viajar2(CIUDAD_A, CIUDAD_B, [conexion(CIUDAD_A,CIUDAD_X,_)|_]) :-
    LS = [conexion(CIUDAD_A,CIUDAD_X,_)|_],
    viajar1(CIUDAD_X,CIUDAD_B, LS).

%Consultas
%?- viajar(saskatoon, vancouver).
%------------------------------------

viajarCosto1(CIUDAD_A, CIUDAD_B, COSTO, LS) :-
    member(conexion(CIUDAD_A, CIUDAD_B, COSTO), LS).

viajarCosto1(CIUDAD_A, CIUDAD_B, COSTO, LS) :-
    member(conexion(CIUDAD_A, CIUDAD_X, COSTO1), LS),
    viajarCosto1(CIUDAD_X,CIUDAD_B, COSTO2, LS),
	COSTO is COSTO1 + COSTO2.

viajarCosto2(CIUDAD_A, CIUDAD_B, COSTO, [conexion(CIUDAD_A,CIUDAD_B,COSTO)|_]).

viajarCosto2(CIUDAD_A, CIUDAD_B, COSTO, [_ | Cola]) :-
    viajarCosto2(CIUDAD_A, CIUDAD_B, COSTO, Cola).

viajarCosto2(CIUDAD_A, CIUDAD_B, COSTO, LS) :-
    LS = [conexion(CIUDAD_A, CIUDAD_X, COSTO1)|_],
    viajarCosto2(CIUDAD_X,CIUDAD_B, COSTO2, LS),
	COSTO is COSTO1 + COSTO2.

%Consultas
%?- viajar(regina,Y,COSTO).
%?- viajar(X,Y, COSTO).