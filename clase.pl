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

%Clase práctica extras
%freeze(X, eval(X)) freezes X and doesnt actually search for it / trigger it's branch until its value gets instantiated
coche(dodge,caliber).
coche(opel,corsa).
coche(toyota,prius).
europea(opel).
comprar(Marca,Modelo) :- freeze(Marca, not(europea(Marca))), coche(Marca, Modelo).

%—————————————————————————————————————————————————————————————————————————————————————

% Caso base: una lista vacía ya está ordenada
quicksort([], []).

% Paso recursivo: toma el primer elemento como pivote ([3,2,4,8]) -> pivote = 3, Rest = [2,4,8] -> partition([2,4,8],3,[2],[4,8])
quicksort([Pivot|Rest], Sorted) :-
    partition(Rest, Pivot, Smaller, Greater),
    quicksort(Smaller, SortedSmaller), %sort everything else Smaller([2],[2])
    quicksort(Greater, SortedGreater), %sort everything else Greater ([4,8])
    append(SortedSmaller, [Pivot|SortedGreater], Sorted). %join it all ([2],[3|4,8],[2,3,4,8])

% Partición de la lista en elementos menores/iguales y mayores que el pivote
partition([], _, [], []).
partition([X|Xs], Pivot, [X|Smaller], Greater) :-
    X =< Pivot,
    partition(Xs, Pivot, Smaller, Greater).
partition([X|Xs], Pivot, Smaller, [X|Greater]) :-
    X > Pivot,
    partition(Xs, Pivot, Smaller, Greater).

%————————————————————————————————————————————————————————————————————————————————————