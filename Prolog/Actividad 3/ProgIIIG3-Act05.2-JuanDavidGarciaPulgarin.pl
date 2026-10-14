%Hechos
conexiones([
           conexion(ciudad(vancouver), ciudad(edmonton), costo(16)),
           conexion(ciudad(vancouver), ciudad(calgary), costo(13)),
           conexion(ciudad(edmonton), ciudad(saskatoon), costo(12)),
           conexion(ciudad(saskatoon), ciudad(winnipeg), costo(20)),
           conexion(ciudad(calgary), ciudad(edmonton), costo(4)),
           conexion(ciudad(saskatoon), ciudad(calgary), costo(9)),
           conexion(ciudad(calgary), ciudad(regina), costo(14)),
           conexion(ciudad(regina), ciudad(saskatoon), costo(7)),
           conexion(ciudad(regina), ciudad(winnipeg), costo(4))
]).

%Reglas
%------------------------------------

estaConectado(X, [conexion(ciudad(X),_,_)|_]).

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

viajar1(A, B, LS) :-
    member(conexion(ciudad(A), ciudad(B), _), LS).

viajar1(A, B, LS) :-
    member(conexion(ciudad(A), ciudad(X), _), LS),
    viajar1(X, B, LS).

viajar2(A, B, [conexion(ciudad(A),ciudad(B),_)|_]).

viajar2(A, B, [_ | Cola]) :-
    viajar2(A, B, Cola).

viajar2(A, B, [conexion(ciudad(A),ciudad(X),_)|_]) :-
    LS = [conexion(ciudad(A),ciudad(X),_)|_],
    viajar2(ciudad(X),ciudad(B), LS).

%Consultas
%?- viajar1(saskatoon, vancouver).
%------------------------------------

viajarCosto1(A, B, COSTO, LS) :-
    member(conexion(ciudad(A), ciudad(B), costo(COSTO)), LS).

viajarCosto1(A, B, COSTO, LS) :-
    member(conexion(ciudad(A), ciudad(X), costo(COSTO1)), LS),
    viajarCosto1(X, B, COSTO2, LS),
	COSTO is COSTO1 + COSTO2.

viajarCosto2(A, B, COSTO, [conexion(ciudad(A),ciudad(B),costo(COSTO))|_]).

viajarCosto2(A, B, COSTO, [_ | Cola]) :-
    viajarCosto2(A, B, COSTO, Cola).

viajarCosto2(A, B, COSTO, LS) :-
    LS = [conexion(ciudad(A), ciudad(X), costo(COSTO1))|_],
    viajarCosto2(X, B, COSTO2, LS),
	COSTO is COSTO1 + COSTO2.

%Consultas
%?- conexiones(LS), viajarCosto1(regina, Y, COSTO, LS).
%?- conexiones(LS), viajarCosto1(X, Y, COSTO, LS).