%miembro(T,L) es cierto sii T es miembro de L

miembro(T,[T|_]).
miemro(T,[_|L]) :- miembro(T,L).

% concat(L1,L2,Lf) es cierto sii LF es resultado de concatenar

concat([],L2,L2).
concat([X|L1],L2,[X|LF]) :- concat(L1,L2,LF).

%inv(L1,L2) es cierto sii L2 es la lista inversa de L1

inv([],[]).
inv([Car|L1], L2) :-  inv(L1, X), concat(X, [Car], L2).

% aplanar(L1,L2) es cierto sii L2 es la lista resultante de quitar las sublistas
% aplanar([1,[2,3,[5,6]],[8]],L2) -> L2=[1,2,3,5,6,8]

aplanar([],[]).
aplanar(Atomo,[Atomo]) :- atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr], Resultado) :- aplanar(Car,Car_aplanado),
                                 aplanar(Cdr,Cdr_aplanado),
				 concat(Car_aplanado, Cdr_aplanado, Resultado).