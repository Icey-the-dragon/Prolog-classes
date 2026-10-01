% primero(L,E) es cierto sii E es el primer elemento de la lista L

primero([Car|_],Car).

% segundo(L,E) es cierto sii E es el segundo elemento de la lista L

segundo([_,Car|_],Car).

%  ultimo(L,E) es cierto sii E es el ultimo elemento de la lista L

ultimo([X],X).
ultimo([_|L],E) :- ultimo(L,E).

%  ultimo(L,E) es cierto sii E es el ultimo elemento de la lista L

penultimo([X,_],X).
penultimo([_|L],E) :- penultimo(L,E).

%  izq_dch(I,D,L) es cierto sii I esta inmediatamente a la izq del elemento D en la lista L

izq_dch(I,D,[I,D|_]).
izq_dch(I,D,[_|L]) :- izq_dch(I,D,L).

% contiguo(A,B,L) es true si A y L son contiguos en la lista L

contiguo(A,B,[A,B|_]).
contiguo(A,B,[B,A|_]).
contiguo(A,B,[_|L]) :- contiguo(A,B,L).

% intercalar(L1,L2,Lf) es true sii LF es el resultado de intercalar L1 y L2

intercalar([],_,[]).
intercalar([Car|_],[],[Car]).
intercalar([X|L1],[Y,L2],[X,Y|LF]) :- intercalar(L1,L2,LF).

% select(T,L,R) es cierto sii T es un elemento de L y R es la lista sin T
% supongamos que eleminarmos el primero (si hay varios)

select(Car,[Car|Cdr],Cdr).
select(T,[X|L],[X|R]) :- select(T,L,R).