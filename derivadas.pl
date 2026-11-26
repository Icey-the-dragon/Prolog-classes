% d(Expresion,Variable,Derivada) es cierto si Derivada es la formula que se
% al derivar Expresion por Variable.

d(X,X,1).
d(C,X,0) :- atomic(C), C \= [], C \= X, C \= e.

d(-A,X,-U) :- d(A,X,U).
d(A+B,X,U+V) :- d(A,X,U),d(B,X,V).
d(A-B,X,U-V) :- d(A,X,U),d(B,X,V).
d(A*B,X,U*B+A*V) :- d(A,X,U),d(B,X,V).
d(A^B,X, B*DA*A^(B-1)) :- A \= e, atomic(B), B \= X, B \= e, d(A,X,DA).
d(A^B,X, A^B*(DB*ln(A)+B*DA/A)) :- d(A,X,DA), d(B,X,DB).

d(sen(A),X,DA*cos(A)) :- d(A,X,DA).
d(cos(A),X,-DA*sen(A)):- d(A,X,DA).

d(ln(A),X, DA/A):- d(A,X,DA).

d(e^A,X,DA*e^A) :- d(A,X,DA).
