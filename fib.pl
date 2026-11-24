%fib(N,F) es verdaad si N es el Nº de fib.
:- dynamic fib/2.

fib(0, 0).
fib(1, 1).
fib(N, R):- N2 is N-2, fib(N2, R2),
    asserta((fib(N2, R2):-!)),
    N1 is N-1, fib(N1, R1),
    R is R1+R2.
