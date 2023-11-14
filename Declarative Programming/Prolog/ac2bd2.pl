%?-['D:/My docs/OneDrive/Uni work/CS-205/ac2bd2.pl'].

%Q1
a2b([],[]).
a2b([a|L1],[b|L2]) :- a2b(L1,L2).

%Q2
stars(0).
rec(0).
rec(N):-N>0,writeq(*),nl,NewN is N-1,rec(NewN).
stars(N):-N>0,rec(N),nl,NewN is N-1,stars(NewN).

prod_sqrs([],1).
prod_sqrs([X|Xs],P) :-
prod_sqrs(Xs,Ps),
P is X*X*Ps.