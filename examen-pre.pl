% Escribe el predicado sin_repetidos(Lista, Resultado) que tome una lista Lista y devuelva en Resultado una lista con los mismos elementos pero sin duplicados,
% conservando el orden de su primera aparición.
miembro(A,[A|_]).
miembro(Elem,[_|Cdr]) :- miembro(Elem,Cdr).

sin_repetidos([],[]).
sin_repetidos([Car|Cdr],R) :- miembro(Car,Cdr), !,sin_repetidos(Cdr,R).
sin_repetidos([Car|Cdr],[Car|R]) :- sin_repetidos(Cdr,R).

%aplanar_dl

aplanar_dl([],X-X).
aplanar_dl(Atomic,[Atomic|Fin]-Fin) :- atomic(Atomic), Atomic\==[],!.
aplanar_dl([Car|Cdr],CarAplanado-Fin) :- aplanar_dl(Car, CarAplanado - Medio), aplanar_dl(Cdr, Medio-Fin).

%concatenar_dl
a_dl([], H - H).
a_dl([X|Xs], [X|H] - F) :-
    a_dl(Xs, H - F).

concat(A, B, R) :-
    a_dl(A, InicioA - HuecoA),
    a_dl(B, InicioB - HuecoB),
    concatenar_dl(InicioA - HuecoA, InicioB - HuecoB, R - []),
    HuecoA = InicioB,
    HuecoB = [].

concatenar_dl(Inicio1 - Hueco, Hueco - Fin2, Inicio1 - Fin2).

invertir_dl([],X-X).
invertir_dl([Car|Cdr], R - Fin) :- invertir_dl(Cdr, R-[Car|Fin]).