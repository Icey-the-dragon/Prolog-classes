% asserta/1 = predicado extraclogico que siempre se verifica, como efecto colateral introduce su argumento al principio de la memoria
% assertz/1 = asserta PERO lo introduce al final
% retract/1 = asserta Pero elimina de la memoria la 1º clausula (FIFO por arriba) que unifica con su arg.
% listing/0 es verdad siempre, visualiza la memoria
% dynamic/1 declara a un arg como predicado dunamico, esto es susceptible a ser usado para asserta, assertz y retract

miembro(Car, [Car|_]).
miembro(Elem, [_|Cdr]) :- miembro(Elem, Cdr), !.

%torres de hanoi - pasos: 
% 1. Pasar N-1 discos de A a C
% 2. Pasar el disco restante de A a B
% 3. Repetir siendo C=A y B=B
% Hanoi(N,A,B,C,Movs) es verdad si Movs son los
% tomando C como la torre de pivote

% hanoi(1, A, B, _, [format("~w a ~w", [A, B])]).
% hanoi(N, A, B, C, R) :- N1 is N-1,
%     hanoi(N1, A, C, B, Movs1),
%     hanoi(N1, C, B, A, Movs2),
%     append(Movs1, [format("~w a ~w", [A, B])|Movs2], R).
:- op(600, xfx, a).
:- dynamic hanoi2/5.

hanoi2(1, A, B, _, [A a B]).
hanoi2(N, A, B, C, R) :- N1 is N-1,
    hanoi2(N1, A, C, B, Movs1),
    asserta((hanoi2(N1, A, C, B, Movs1):-!)),
    hanoi2(N1, C, B, A, Movs2),
    retract((hanoi2(N1, A, C, B, Movs1):-!)),
    append(Movs1, [A a B|Movs2], R).
