merge_union([], Y, Y).
merge_union(X, [], X).
merge_union([X|Xs], [Y|Ys], [X|Zs]):-
    X = Y, !,
    merge_union(Xs, Ys, Zs).
merge_union([X|Xs], [Y|Ys], [X|Zs]):-
    X < Y, !,
    merge_union(Xs, [Y|Ys], Zs).
merge_union(X, [Y|Ys], [Y|Zs]):-
    merge_union(X, Ys, Zs).

merge_inter([], Y, []).
merge_inter(X, [], []).
merge_inter([X|Xs], [Y|Ys], [X|Zs]):-
    X = Y, !,
    merge_inter(Xs, Ys, Zs).
merge_inter([X|Xs], [Y|Ys], Zs):-
    X < Y, !,
    merge_inter(Xs, [Y|Ys], Zs).
merge_inter(X, [Y|Ys], Zs):-
    merge_inter(X,Ys,Zs).

merge_diff([], Y, []).
merge_diff(X, [], X).
merge_diff([X|Xs], [Y|Ys], Zs):-
    X = Y, !,
    merge_diff(Xs, Ys, Zs).
merge_diff([X|Xs], [Y|Ys], [X|Zs]):-
    X < Y, !,
    merge_diff(Xs, [Y|Ys], Zs).
merge_diff([X|Xs], [Y|Ys], Zs):-
    merge_diff([X|Xs],Ys,Zs).

merge_sim_diff([], Y, Y).
merge_sim_diff(X, [], X).
merge_sim_diff([X|Xs], [Y|Ys], Zs):-
    X = Y, !,
    merge_sim_diff(Xs, Ys, Zs).
    X < Y, !,
    merge_sim_diff(Xs, [Y|Ys], Zs).
merge_sim_diff([X|Xs], [Y|Ys], [Y|Zs]):-
    merge_sim_diff([X|Xs],Ys,Zs).
