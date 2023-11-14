%?-['D:/My docs/OneDrive/Uni work/CS-205/recursion.pl'].

%Q1
%footmassage(Y, mother(Y)) = footmassage(mother(vincent), mother(Z)).
%Y = mother(vincent).
%mother(Y) = mother(Z).

%Q2
train(swansea, cardiff).
train(cardiff, manchester).
train(cardiff, bristol).
train(cardiff, london).
train(london, paris).
train(paris, munich).
train(munich, vienna).

connection(X,Y) :- train(X,Y).
connection(X,Y) :- train(X,Z),connection(Z,Y) ; train(Y,Z),connection(Z,X).

%Q3
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(V1,V2,V3,H1,H2,H3) :- word(V1, _,_,_,_,_,_,_), word(V2,_,_,_,_,_,_,_), word(V3,_,_,_,_,_,_,_) ,word(H1,_,_,_,_,_,_,_),word(H3,_,_,_,_,_,_,_),word(H3,_,_,_,_,_,_,_).
%crossword(astante,astoria,baratto,cobalto,pistola,statale).

% take a look
a2b([],[]).
a2b([a|L1],[b|L2]) :- a2b(L1,L2).
a2b([_|L1],[_|L2]) :- a2b(L1,L2).
				
