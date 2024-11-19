dellast([_], []) :- !.
dellast([X|Xs], [X|Y]):-
    dellast(Xs, Y).

pref([], [[]]).
pref(X, [X|L]) :-
    dellast(X, Y),
    pref(Y,L).

postf([], [[]]).
postf(X, [X|L]):-
    X = [_|Ys],
    postf(Ys, L).

segment([], [[]]).
segment(X, [X|L]) :-
    postf(X, R),
    dellast(X, X1),
    segment(X1, L1),
    append(R, L1, A),
    list_to_set(A, [X|L]).

rearr([], []).
rearr([X|L], P) :-
    rearr(L, L1),
    insert(X, L1, P).

insert(X, L, [X|L]).
insert(X, [H|T], [H|P]) :-
    insert(X, T, P).

list_to_set2([],[]).

list_to_set2([X|Xs], Y) :-
    member(X, Xs),
    list_to_set2(Xs, Y).

list_to_set2([X|Xs], [X|Y]):-
    member(X, Xs) \= false,
    list_to_set2(Xs, Y).
