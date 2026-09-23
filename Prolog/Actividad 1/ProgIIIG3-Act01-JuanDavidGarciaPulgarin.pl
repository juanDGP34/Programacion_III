%Hechos
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

madre(mona, herbert).
madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

%Reglas
abuelo(X, Y) :- 
    padre(X,Z), padre(Z,Y);
    padre(X,Z), madre(Z,Y);
    madre(X,Z),madre(Z,Y);
    madre(X,Z), padre(Z,Y).

%?- abuelo(abraham, bart).
%?- abuelo(X, lisa).
%?- abuelo(jacqueline, Y).
%?- abuelo(X, ling).
%?- abuelo(mona, ling).

hermano(X,Y) :- 
    padre(Z,X), padre(Z,Y), X \= Y; 
    madre(Z,X),madre(Z,Y), X\= Y.

%?- hermano(bart, lisa).
%?- hermano(X, homero). 
%?- hermano(X, marge).
%?- hermano(herbert, marge).
%?- hermano(X, Y).

tio(X,Y) :- 
    padre(Z,Y), hermano(X,Z); 
    madre(Z,Y), hermano(X,Z).

%?- tio(patty, bart).
%?- tio(X, maggie). 
%?- tio(herbert, Y).
%?- tio(selma, ling).
%?- tio(X, Y).

primo(X,Y) :- 
    tio(Z,X), padre(Z,Y); 
    tio(Z,X), madre(Z,Y).

%?- primo(bart, ling). 
%?- primo(X, ling). 
%?- primo(lisa, Y).
%?- primo(bart, lisa).
%?- primo(ling, helbert).

esposos(X,Y) :- 
    padre(X,Z), madre(Y,Z); 
    padre(Y,Z), madre(X,Z).

%?- esposos(homero, marge).
%?- esposos(clancy, Y). 
%?- esposos(X, mona). 
%?- esposos(selma, homero). 
%?- esposos(abraham, jacqueline)

cunado(X,Y) :- 
    esposos(Y,Z), hermano(X,Z); 
    esposos(X,Z), hermano(Y,Z).

%?- cunado(patty, homero).
%?- cunado(X, homero).  
%?- cunado(herbert, Y).
%?- cunado(marge, patty).
%?- cunado(X, Marge).

suegro(X,Y) :- 
    padre(X,Z), esposos(Y,Z);
    madre(X,Z), esposos(Y,Z).

%?- suegro(clancy, homero). 
%?- suegro(X, homero). 
%?- suegro(abraham, Y).
%?- suegro(jacqueline, marge). 
%?- suegro(herbert, lisa).

yerno_nuera(X,Y) :-
    padre(Y, Z), esposos(Z,X);
    madre(Y, Z), esposos(Z,X).

%?- yerno_nuera(homero, jacqueline).
%?- yerno_nuera(X, clancy). 
%?- yerno_nuera(marge, Y).
%?- yerno_nuera(bart, abraham).
%?- yerno_nuera(X, Y).
