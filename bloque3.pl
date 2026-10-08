%miembro(T,L) es cierto sii T es miembro de L

miembro(T,[T|_]).
miemro(T,[_|L]) :- miembro(T,L).

% concat(L1,L2,Lf) es cierto sii LF es resultado de concatenar

concat([],L2,L2).
concat([X|L1],L2,[X|LF]) :- concat(L1,L2,LF).

%inv(L1,L2) es cierto sii L2 es la lista inversa de L1

inv([],[]).
inv([Car|L1], L2) :-  inv(L1, X), concat(X, [Car], L2).

% select(T,L,R) es cierto sii T es un elemento de L y R es la lista sin T
% supongamos que eleminarmos el primero (si hay varios)

select(Car,[Car|Cdr],Cdr).
select(T,[X|L],[X|R]) :- select(T,L,R).

%% partimos de estas funciones
%%subc(R,X) es verdad si R es subconjunto de X
subc([],_).
subc([Car|Cdr],D) :- select(Car,D,D2), subc(Cdr,D2).

%linea(A,L,L2) - intercala, A en L Para linea(1,[a,b,c],X) X= [[1,a],[1,b],[1,c]
linea(_,[],[]).
linea(X, [Car|Cdr],[[X,Car]|R]) :- linea(X,Cdr,R).

%cartesiano(L1,L2,R) :- producto cartesiano entre elementos entre L1 y L2

cartesiano([], _,[]).
% cartesiano([Car|Cdr],L,[R1|R2]) :- linea(Car,L,R1), cartesiano(Cdr,L,R2).
cartesiano([Car|Cdr],L,R) :- linea(Car,L,R1), cartesiano(Cdr,L,R2), concat(R1,R2,R).

%encolar mete E en la cola L para dar R encolar(E,L,R)
encolar(X,[],[X]).
encolar(X,[Car|Cdr],[Car|R]) :- encolar(X,Cdr,R).

%sacar(L,R1,LR) saca de la lista L el sig elemento R y devuelve la lista sin el
% sacar([X],X,[]).
sacar([Car|Cdr],Car,Cdr).