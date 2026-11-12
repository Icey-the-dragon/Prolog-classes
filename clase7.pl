ca1([],[]).
ca1([Car|Cdr],[0|R]) :- Car == 1,!, ca1(Cdr,R).
ca1([_|Cdr],[1|R]) :- ca1(Cdr,R).

linea(_,[],[]).
linea(X, [Car|Cdr],[[X,Car]|R]) :- linea(X,Cdr,R).

:- op(100, xfx,[por]).
:- op(200, yfx,[es]).
:- op(300, fx,[cartesiano_del]).
:- op(400, fx,[el]).


el cartesiano_del [] por _ es [].
el cartesiano_del [Car|Cdr] por L es R :- linea(Car,L,R1), el cartesiano_del Cdr por L es R2, append(R1,R2,R).