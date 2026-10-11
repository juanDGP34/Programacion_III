%Hechos
padre(abraham, [herbert, homero]).
padre(clancy, [marge, patty, selma]).
padre(homero, [bart, lisa, maggie]).

madre(mona, [herbert, homero]).
madre(jacqueline, [marge, patty, selma]).
madre(marge, [bart, lisa, maggie]).
madre(selma, [ling]).

%Reglas

%-------------------------------------------------
%Caso base
hijoEnLista(HIJO, [HIJO|_]).

%Caso recursico
hijoEnLista(HIJO, [_|COLA]) :-
    hijoEnLista(HIJO, COLA).

hijoDe(PADRE, HIJO) :-
    padre(PADRE, [_|COLA]),
    hijoEnLista(HIJO, COLA);
    madre(PADRE, [_|COLA]),
    hijoEnLista(HIJO, COLA).
%-------------------------------------------------

hijo_de(PADRE, HIJO) :-
    padre(PADRE, HIJOS),
    member(HIJO, HIJOS);
    madre(PADRE, HIJOS),
    member(HIJO, HIJOS).
%-------------------------------------------------

abuelo(ABUELO, NIETO) :-
    hijo_de(ABUELO, HIJO),
    hijo_de(HIJO, NIETO).

%?- abuelo(abraham, bart).
%?- abuelo(X, lisa).
%?- abuelo(jacqueline, Y).
%?- abuelo(X, ling).
%?- abuelo(mona, ling).
%-------------------------------------------------

hermano(X, Y) :-
    hijo_de(PADRE, X),
    hijo_de(PADRE, Y),
    X \= Y.

%?- hermano(bart, lisa).
%?- hermano(X, homero). 
%?- hermano(X, marge).
%?- hermano(herbert, marge).
%?- hermano(X, Y).
%-------------------------------------------------

tio(X,Y) :-
    hijo_de(PADRE, Y), hermano(PADRE, X).

%?- tio(patty, bart).
%?- tio(X, maggie). 
%?- tio(herbert, Y).
%?- tio(selma, ling).
%?- tio(X, Y).
%-------------------------------------------------

primo(X,Y) :-
    tio(Z,X), hijo_de(Z,Y).

%?- primo(bart, ling). 
%?- primo(X, ling). 
%?- primo(lisa, Y).
%?- primo(bart, lisa).
%?- primo(ling, helbert).
%-------------------------------------------------

esposos(X,Y) :-
    hijo_de(X,Z), 
    hijo_de(Y,Z),
    X \= Y.

%?- esposos(homero, marge).
%?- esposos(clancy, Y). 
%?- esposos(X, mona). 
%?- esposos(selma, homero). 
%?- esposos(abraham, jacqueline)
%-------------------------------------------------

cunado(X,Y) :-
    esposos(Y,Z), hermano(X,Z).

%?- cunado(patty, homero).
%?- cunado(X, homero).  
%?- cunado(herbert, Y).
%?- cunado(marge, patty).
%?- cunado(X, Marge).
%-------------------------------------------------

suegro(X,Y) :-
    hijo_de(X,Z), esposos(Z,Y).

%?- suegro(clancy, homero). 
%?- suegro(X, homero). 
%?- suegro(abraham, Y).
%?- suegro(jacqueline, marge). 
%?- suegro(herbert, lisa).
%-------------------------------------------------

yerno_nuera(X,Y) :-
    hijo_de(Y, Z), esposos(Z,X).

%?- yerno_nuera(homero, jacqueline).
%?- yerno_nuera(X, clancy). 
%?- yerno_nuera(marge, Y).
%?- yerno_nuera(bart, abraham).
%?- yerno_nuera(X, Y).
%-------------------------------------------------