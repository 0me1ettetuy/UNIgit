%without
without([], _, []).

without([L|Tail],X,R):-
    L = X,
    without(Tail, X, R).

without([L|Tail],X,[L|R]):-
    L \= X,
    without(Tail,X,R).

%deepwithout
deepwithout([], _, []).

deepwithout([X|Tail], X, Result) :-
    !,
    deepwithout(Tail, X, Result).

deepwithout([L|Tail], X, [R|Result]) :-
    is_list(L),
    !,
    deepwithout(L, X, R),
    deepwithout(Tail, X, Result).

deepwithout([L|Tail], X, [L|Result]) :-
    deepwithout(Tail, X, Result).

%flattened
flattened([], []).

flattened([H|T], Flat) :-
    is_list(H),
    !,
    flattened(H, FlatH),
    flattened(T, FlatT),
    append(FlatH, FlatT, Flat).

flattened([H|T], [H|FlatT]) :-
    \+ is_list(H),
    flattened(T, FlatT).

%makepairs
makepair(X, Y, pair(X, Y)).

makepairs([], _, []).

makepairs([L|Tail], X, [Pair|Result]) :-
    makepair(L, X, Pair),
    makepairs(Tail, X, Result).

%cartesian
cartesian([], _, []).

cartesian([Xhead|Xtail], Y, P) :-
    makepairs(Y, Xhead, Z),
    append(Z, R, P),
    cartesian(Xtail, Y, R).


%deepsum
deepsum([], 0).

deepsum([H|T], S) :-
    number(H),
    !,
    deepsum(T, Stail),
    S is H + Stail.

deepsum([H|T], S) :-
    is_list(H),
    !,
    deepsum(H, Shead),
    deepsum(T, Stail),
    S is Shead + Stail.

deepsum([_|T], S) :-
    deepsum(T, S).

%deepsumsplitter
deepsum([], 0, 0).

deepsum([H|T], P, N) :-
    number(H),
    H > 0,
    !,
    deepsum(T, Ptail, Ntail),
    P is H + Ptail,
    N is Ntail.

deepsum([H|T], P, N) :-
    number(H),
    H < 0,
    !,
    deepsum(T, Ptail, Ntail),
    P is Ptail,
    N is H + Ntail.

deepsum([H|T], P, N) :-
    is_list(H),
    !,
    deepsum(H, Phead, Nhead),
    deepsum(T, Ptail, Ntail),
    P is Phead + Ptail,
    N is Nhead + Ntail.

deepsum([_|T], P, N) :-
    deepsum(T, P, N).




%nthprime

prime(2).
prime(N) :-
    not(hasdivisor(N, 2, N)),
    N > 1.

primeafter(LB, N, Start, Prime) :-
    LB =:= N,
    Prime is Start - 1,
    !.

primeafter(LB, N, Start, Prime) :-
    LB < N,
    not(prime(Start)),
    !,
    Next is Start + 1,
    primeafter(LB, N, Next, Prime).

primeafter(LB, N, Start, Prime) :-
    LB < N,
    prime(Start),
    !,
    Next is Start + 1,
    Count is LB + 1,
    primeafter(Count, N, Next, Prime).

hasdivisor(N, LB, UB) :-
    (LB < UB),
    (N mod LB =:= 0),
    !.
hasdivisor(N, LB, UB) :-
    LB < UB,
    Next is LB + 1,
    hasdivisor(N, Next, UB).

nthprime(1, 2).
nthprime(N, Prime) :-
    N > 1,
    primeafter(0, N, 1, Prime).


