    union1([], L, L).

union1([X|Xs],Z,Ys) :-
    member(X, Z),!,
    union1(Xs, Z, Ys).

union1([X|Xs],Z,[X|Ys]) :-
    union1(Xs, Z, Ys).


intersection1([], L, []).

intersection1([X|Xs],Z,[X|Ys]) :-
    member(X,Z), !,
    intersection1(Xs, Z, Ys).

intersection1([X|Xs],Z,Ys) :-
    intersection1(Xs, Z, Ys).

diff1([], L, []).

diff1([X|Xs],Z,Ys) :-
    member(X,Z), !,
    diff1(Xs, Z, Ys).

diff1([X|Xs],Z,[X|Ys]) :-
    diff1(Xs, Z, Ys).
