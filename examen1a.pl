%Describir una M´aquina de Turing capaz de reconocer el lenguaje L = {0^n1^n, n ≥ 1}
igual(X,X).

miembro([],[]).
miembro(Elem,[Car|Cdr]):-igual(Elem,Car);miembro(Elem,Cdr).

%Escribe una regla en Prolog llamada concat(L1, L2, R)
%que sea cierta si la lista R es el resultado de concatenar las listas L1 y L2.   

concat([],L1,L1).
concat([Car|Cdr],L,[Car|T]):-concat(Cdr,L,T).

%Escribe una regla en Prolog llamada inv(L, I) que sea cierta si I es la lista inversa (o invertida) de la lista L.

inv([],[]).
inv([Car|Cdr],R):-inv(Cdr,L2),concat(L2,[Car],R).

%Escribe una regla en Prolog llamada ultimo(L, E) que sea cierta si E es el último elemento de la lista L.

ultimo([X],X).
ultimo([_|Cdr],X):-ultimo(Cdr,X).

%Escribe una regla en Prolog llamada subconj(L1, L2) que sea cierta si la lista L1 está contenida en la lista L2.

subconj([],_).
subconj([Car|Cdr],L2):-miembro(Car,L2),subconj(Cdr,L2).

%Escribe una regla en Prolog llamada aplanar(L, R) que sea cierta si R es la lista resultante de aplanar una lista L que puede contener listas anidadas en su interior.

aplanar([],[]).
aplanar(X,[X]) :- atomic(X),!,X\==[].
aplanar([Car|Cdr],ListaAplanada):-aplanar(Car,CarAplanado),aplanar(Cdr,CdrAplanado),concat(CarAplanado,CdrAplanado,ListaAplanada).

%Escribe un predicado en Prolog llamado maximo(X, Y, Max) que devuelva en Max el mayor de dos números X e Y.
%Utiliza el operador de corte (!) para evitar que Prolog evalúe ramas innecesarias cuando X >= Y.

maximo(X,Y,X):- X >= Y,!.
maximo(_,Y,Y).

%Escribe un predicado en Prolog llamado eliminar_primero(Elem, Lista, Resultado) que sea 
%cierto si Resultado es la lista obtenida tras eliminar únicamente la primera aparición del elemento Elem en Lista.

eliminar_primero(X,[X|Cdr],Cdr) :- !.
eliminar_primero(X,[Car|Cdr],[Car|R2]):-eliminar_primero(X,Cdr,R2).
