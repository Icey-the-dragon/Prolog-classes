%quicksort
quick([], []).
quick([Car|Cdr], R) :- partir(Car, Cdr, Izq, Der),
    quick(Izq, Izq_Ord),
    quick(Der, Der_Ord),
    append(Izq_Ord, [Car|Der_Ord], R).

partir(_, [], [], []).
partir(Pivot, [Car|Cdr], [Car|Izq], Der) :- Car =<  Pivot, !,
    partir(Pivot, Cdr, Izq, Der).

partir(Pivot, [Car|Cdr], Izq, [Car|Der]) :- partir(Pivot, Cdr, Izq, Der).

%operadores: necesitan una prioridad, a menor numero mayor prioridad.
%tambien una representación como "xfx" "xfy" o etc, x representa la posicion de una expresión cuyo operador principal tiene menor prioridad que f, "y" superior o igual que "f" y "" la del juntor respecto x e y"
%analogia(Fig1,Fig2,Fig3,Fig4,Relacion).
%es T si Fig1 es a Fig2 como Fig3 es a Fig4 mediante la realacion relación
% analogia(Fig1, Fig2, Fig3, Fig4, R) :- verifica(Fig1, Fig2, R),
%     verifica(Fig3, Fig4, R).
% % R contenido en  [Interior, Borde, iguales, inverso]
% verifica(a, b, inverso).
% verifica(a, d, borde).
% verifica(a, e, interior).
% verifica(a, f, inverso).
% verifica(b, c, borde).
% verifica(b, f, igual).
% verifica(c, d, interior).
% verifica(c, e, inverso).
% verifica(c, f, borde).

% Usando operadores quedaria ----
:-op(50, xf, [de]).
:-op(100, xfx, [dentro]).
:-op(150, fx, [a]).
:-op(200, xfx, [es]).
:-op(300, xfx, [como]).
:-op(400, xfx, [mediante]).

figura(cuadrado dentro de triangulo).

verifica(F1 dentro de _, F1 dentro de _, interior).
verifica(_ dentro de F2, _ dentro de F2, borde).
verifica(F1 dentro de F2, F2 dentro de F1, inverso).
verifica(F1 dentro de F2, F1 dentro de F2, igual).

analogia(F1 es_a F2 como F3 es_a F4 mediante Relacion).
