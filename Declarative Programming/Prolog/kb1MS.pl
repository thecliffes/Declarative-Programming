%?-[kb1MS]
%?-['D:/My docs/OneDrive/Uni work/CS-205/kb1MS.pl']

woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
party.


happy(yolanda).
playsAirGuitar(X) :- listensToMusic(X).
listensToMusic(mia).
listensToMusic(yolanda):- happy(yolanda).

happy(vincent).
listensToMusic(butch).
happy(butch).
playsAirGuitar(vincent):- listensToMusic(vincent),happy(vincent).
playsAirGuitar(butch):- happy(butch).
playsAirGuitar(butch):- listensToMusic(butch).


loves(vincent,mia).
loves(marcellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

jealous(X,Y):- loves(X,Z),loves(Y,Z),X\=Y.