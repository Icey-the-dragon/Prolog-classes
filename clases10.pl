%p(arbol,Startpos,Endpos) es verdad si Arbol es palindromo entre startpos y endpos.
%palindromos
%B.D Intensiva
% p(p(C,P,C), P0, P3) :- c(C, P0, P1), p(P,P1,P2), c(C,P2,P3).
% p(p(C),P0,P1) :- c(C,P0,P1).
% p(p(nil), P0, P0).

%B.D extensiva sería así
% c(a,0,1).
% c(a,3,4).
% c(b,1,2).
% c(b,2,3).

%arbol extensivo usando dif de listas
% p(Arbol, Lista) es verdad sii Arbol es er arbol sintactico al texto en la lista Lista
% B.D Intensiva =======================================================================
p(Arbol, Lista) :- pal(Arbol, Lista-[]).
pal(p(C,P,C), P0-P3) :- c(C,P0-P1), pal(P,P1-P2), c(C,P2-P3).
pal(p(C), P0-P1) :- c(C, P0-P1).
pal(p(nil), P0-P0).
% =====================================================================================
% B.D Extensiva
c(Elem, [Elem|X]-X).

% =====================================================================================
% Esqueleto gramática español
% f- > SN SV
% SN -> nombre
% SN -> det nombre
% SN -> det nombre adj
% SV -> verbo
% SV -> verbo SN
% SV -> verbo sPrep
% B.D Intensiva =======================================================================
frase(Arbol, Lista) :- f(Arbol, Lista-[]).
f(f(SN,SV), P0-P2) :- sn(SN,_,Num,P0-P1),sv(SV,Num,P1-P2).
sn(sn(Nombre),Gen,Num,P0-P1) :- nombre(Nombre, Gen, Num, P0-P1).
sn(sn(Det,N),Gen,Num,P0-P2):-det(Det,Gen,Num,P0-P1), nombre(N,Gen,Num,P1-P2).
sv(sv(V,SN),Num,P0-P2):-verbo(V,Num,P0-P1), sn(SN,_,Num,P1-P2).
sv(sv(Verbo),Num,P0-P1) :- verbo(Verbo, Num, P0-P1).
sv(sv(V,SPrep),Num,P0-P2):-verbo(V,Num,P0-P1),sprep(SPrep,P1-P2).
sprep(sprep(Prep,Sn),P0-P2) :- prep(Prep,P0-P1), sn(Sn,_,_,P1-P2).
% =====================================================================================
% B.D Extensiva
det(el,m,s,[el|X]-X).
det(la,f,s,[la|X]-X).
det(los,m,p,[los|X]-X).
det(las,f,p,[las|X]-X).
nombre(perro,m,s,[perro|X]-X).
nombre(cafeteria,f,s,[cafeteria|X]-X).
verbo(come,s,[come|X]-X).
prep(en,[en|X]-X).
% =====================================================================================
