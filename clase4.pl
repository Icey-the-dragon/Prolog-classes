:- op(590, xfy, [batman]).

igual(X,X).

inv(A,B) :- inv_dl(A,B-[]).

inv_dl([], X-X).
inv_dl([Car|Cdr], X-Y) :- inv_dl(Cdr, X-[Car|Y]). % ejemplo: inv_dl([1,2|[3,4]],[4,3,2,1|Y]\Y) == inv_dl([3,4], [4,3,2,1|Y]\[3,4|Y])

aplanar_dl([],X-X).
aplanar_dl(Atomo, [Atomo]) :- atomic(Atomo), Atomo \== [].

aplanar_dl([Car|Cdr], Aplanado-Z) :- aplanar_dl(Car, Aplanado-Y),
                                     aplanar_dl(Cdr, Y-Z).


linea(L,Y,R) :- linea_dl(L,Y,R-[]).

linea_dl(_, [], X-X).
linea_dl(E, [Car|Cdr], [[E,Car]|X]-Y) :- linea_dl(E,Cdr,X-Y).

cartesiano(A,B,C) :- cartesiano_dl(A,B,C-[]).

cartesiano_dl([],_,X-X).
cartesiano_dl([Car|Cdr],Conj,Result-Z) :-
    linea_dl(Car,Conj,Result-Y),
    cartesiano_dl(Cdr,Conj,Y-Z).    


partir(_,[],[],[]).
partir(Pivot,[Car|Cdr],[Car|Izq],Der) :- Car < Pivot,
                                         !,
                                         partir(Pivot,Cdr,Izq,Der).
partir(Pivot,[Car|Cdr],Izq,[Car|Der]) :- partir(Pivot,Cdr,Izq,Der).


quicksort_dl([],X batman X).
quicksort_dl([Car|Cdr],Ordenado batman Z) :- partir(Car,Cdr,Izq,Der),
                          quicksort_dl(Izq,Ordenado batman [Car|Y]),
                          quicksort_dl(Der,Y batman Z).