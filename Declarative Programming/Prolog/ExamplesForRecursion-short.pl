%Examples for recursion
%?-['users/Monika/dropbox/cs205/2021week10/ExamplesforRecursion-short.pl'].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 1: factorial function


fact(0,1).  % 0! = 1
            % n! = n * (n-1)!
fact(N,F) :-
        N>0,
        N1 is N-1,
        fact(N1,F1),
        F is N*F1.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 2:  fibonacci

fib(0,1).
fib(1,1).

fib(N,F) :-
        N > 1,
        N1 is N-1,
        N2 is N-2,
        fib(N1,F1),
        fib(N2,F2),
        F is F1+F2.

%?-fib(5,X).    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 3
%
justAte(mosquito,blood(john)).
justAte(frog,mosquito).
justAte(stork,frog).

isDigesting(X,Y):- justAte(X,Y).
isDigesting(X,Y):- justAte(X,Z), isDigesting(Z,Y).

% ?- isDigesting(stork,mosquito).
% ?- isDigesting(mosquito,blood(john)).
% ?- isDigesting(mosquito,X).
% ?- isDigesting(frog,X).
% ?- isDigesting(stork,X).
% ?- isDigesting(X,mosquito).
% ?- isDigesting(X,blood(john)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 4
%
child(anna,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).


descend(X,Y):- child(X,Y).
descend(X,Y):- child(X,Z), descend(Z,Y).


% ?- descend(anna,anna).
% ?- descend(anna,bridget).
% ?- descend(anna,caroline).
% ?- descend(anna,X).
% ?- descend(X,donna).
% ?- descend(X,Y).   %How many responses?

    %What happens if you swap the two rules? Check with the forth query (descend(anna,X)).
    %What happens if you swap the predicates child and descend in the second rule.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Example 5
%
loop(0).
loop(N):-N>0,write(N),nl,NewN is N-1,loop(NewN).

% ?- loop(3).

% Can you make the same work with printing stars?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 6
%
myBetween(X,Y,X):- X=<Y.
myBetween(X,Y,Z):- X<Y, NewX is X+1, myBetween(NewX,Y,Z).

% ?- myBetween(10,15,7).
% ?- myBetween(10,15,12).
% ?- myBetween(10,15,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 7: recursion over lists: member and member_rem



member(X,[X|_]).
member(X,[_|T]):- member(X,T).


% How many solutions does the query ?-member(X,[4,3,1,2,6]) give?    Poll!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

member_rem(X,[X|Xs],Xs).
member_rem(X,[Y|Ys],[Y|R]) :-
        member_rem(X,Ys,R).    
    
%?- member_rem(3,[4,3,1,2,6],R).
%?- member_rem(X,[4,3,1,2,6],R).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
