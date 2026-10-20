% not(P) dá lo contrario a P osea not(true) = false
not(P) :- P,!,fail.
not(_).

%igual(X,X) true si X=X
igual(X,X).

guapa(luisa).
guapa(carmen).

%this doesnt work: fea(P):-not(guapa(P)).
% we need to wait evaluation
%fea(P):- freeze(P,not(guapa(p))).
%or
fea(P):- when(nonvar(P),not(guapa(P))).

humano(P):- freeze(M,humano(M)), madre(P,M).
humano(elena).
madre(juan,elena).
