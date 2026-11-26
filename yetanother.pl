% inorden(arbol(Hoja,nil,nil),[Hoja]):-!. % si estamos en una hoja, no evalues la hija de más formas
% inorden(arbol(Hoja,X,nil),Res) :- inorden(HijoIzq,InordenHijoIzq),append(InordenHijoIzq,[Hoja],Res). % si estamos en un nodo rama con un solo ijo a la izquierda, devuelve  Incorden(Hijo), rama
% inorden(arbol(Hoja,nil,HijoDer),[Hoja|InordenHijoDer]) :- inorden(HijoDer,InordenHijoDer).% si estamos en un nodo rama con un solo Hijo a la derecha, devuelve rama, Inorden(Hijo)
% inorden(arbol(Hojao,HijoIzq,HijoDer),Res) :- inorden(HijoIzq,InordenHijoIzq),inorden(HijoDer,InordenHijoDer),append(InordenHijoIzq,[Hoja],D),append(D,InordenHijoDer,Res). %devolver Inordern(HIzq), hoja, Inorden(HijoDer)

% vamos a añadir Pointers
inorden(X,Y) :- inorden_pl(X,Y-[]).

inorden_pl(arbol(Hoja,nil,nil),[Hoja|PtrFin] - PtrFin):-!. %añadimos pointer al final de hoja
inorden_pl(arbol(Hoja,HijoIzq,nil),InordenHijoIzq - PtrFin) :- inorden_pl(HijoIzq,InordenHijoIzq - [Hoja|PtrFin]). % ya que añadimos un pointer PtrFin al final, podemos en vez de hacer un append, poner inordern + Ptr y añadir Hoja a la izq del pointer
inorden_pl(arbol(Hoja,nil,HijoDer),[Hoja|InordenHijoDer] - PtrFin) :- inorden_pl(HijoDer,InordenHijoDer - PtrFin).% no hay append, nos dá igual pero añadimos pointer
inorden_pl(arbol(Hoja,HijoIzq,HijoDer),InordenHijoIzq - PtrFin) :- inorden_pl(HijoIzq,InordenHijoIzq - [Hoja|Interpolador]),inorden_pl(HijoDer,Interpolador - PtrFin).
% para el último, el pointer tiene que estar al final, osea que hemos de poner el PtrFin al final del inordenHijoDer, ya que el primero que hau es InordenHijoIzq
% ese tendrá q ser el inicio. Nuestro InordenHijoDer se transforma en un enlace entre el puntero del final y el InordenHijoIzq. pero nos falta añadir la hoja.
% podemos añadirla a la izq del Puntero de fin 

% =======================================================================================================================================================================
% preorden(arbol(A,nil,nil),[A]) :-!.
% preorden(arbol(A,X,nil),[A|S]) :- preorden(X,S),!.
% preorden(arbol(A,nil,X),[A|S]) :- preorden(X,S),!.
% preorden(arbol(A,X,Y),[A|S]) :- preorden(X,T),preorden(Y,O),!,
%     		                append(T,O,S).
preorden(X,Y) :- preorden_pl(X,Y-[]).

preorden_pl(arbol(Hoja,nil,nil),[Hoja|PtrFin] - PtrFin) :-!.
preorden_pl(arbol(Hoja,HijoIzq,nil),[Hoja|Res] - PtrFin) :- preorden_pl(HijoIzq,Res - PtrFin),!.
preorden_pl(arbol(Hoja,nil,HijoDer),[Hoja|Res] - PtrFin) :- preorden_pl(HijoDer,Res - PtrFin),!.
preorden_pl(arbol(Hoja,HijoIzq,HijoDer),[Hoja|PreordenHijoIzq] - PtrFin) :- preorden_pl(HijoIzq,PreordenHijoIzq - Interpolador),preorden_pl(HijoDer,Interpolador - PtrFin),!.

% =======================================================================================================================================================================
% postorden sin guia :

posorden(X,Y) :- posorden_pl(X,Y-[]).

posorden_pl(nil, P - P) :- !.
posorden_pl(arbol(Hoja,HijoIzq,HijoDer),PostordenHijoIzq - PtrFin) :- posorden_pl(HijoIzq, PostordenHijoIzq - Interpolador), posorden_pl(HijoDer, Interpolador - [Hoja|PtrFin]).


% =======================================================================================================================================================================
% solo las hojas
hojas(X,Y) :- hojas_dl(X,Y-[]).

hojas_dl(arbol(Hoja,nil,nil),[Hoja|PtrFin] - PtrFin) :- !.
hojas_dl(nil, P - P):- !.
hojas_dl(arbol(_,HijoIzq,HijoDer), HojasHijoIzq - PtrFin) :-  hojas_dl(HijoIzq, HojasHijoIzq - Interpolador), hojas_dl(HijoDer, Interpolador - PtrFin).

% =======================================================================================================================================================================
mayores_de(X,Y,Z) :- mayores_dl(X,Y,Z-[]).

mayores_dl(_,[],[]).
mayores_dl(Elem,[Car|Cdr],[Car|Res]) :- Car > Elem, !, mayores_dl(Elem, Cdr,Res).
mayores_dl(Elem,[_|Cdr],L) :- mayores_dl(Elem, Cdr,L).

% =======================================================================================================================================================================
aplanar(X,Y) :- aplanar_dl(X,Y-[]).

aplanar_dl([],X-X).
aplanar_dl(X,[X|Ptr]-Ptr) :- atomic(X), X\==[].
aplanar_dl([Car|Cdr],Init - PtrFin) :- aplanar_dl(Car, Init - Interpolador), aplanar_dl(Cdr ,Interpolador - PtrFin).

% =======================================================================================================================================================================

inv(X,Y) :- inv_dl(X,Y-[]).
inv_dl([],X-X).
inv_dl([Car|Cdr],Res-Fin) :- inv_dl(Cdr, Res-[Car|Fin]).