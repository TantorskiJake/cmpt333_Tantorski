%Jake Tantorski - Structure Inspection CMPT333N Apr 10, 2020

%Occurences Function Question 1

occurrences(Sub,Term,N) :-
    occurrences(Sub,Term,0,N).

occurrences(Term,Term,N,Val) :-
    N1 is N+1,
    compound(Term), !,
    Term=..[_|Xs], occurrencesList(Term,Xs,N1,Val).

occurrences(Sub,Term,N,Val) :-
    compound(Term), !,
    Term=..[_|Xs], occurrencesList(Sub,Xs,N,Val).

occurrences(Term,Term,N,N1) :- N1 is N+1.
occurrences(_,_,N,N).

occurrencesList(_,[],N,N).
occurrencesList(Sub,[X|Xs], N, N2) :-
    occurrencesList(Sub,Xs,N,N1),
    occurrences(Sub,X,N1,N2).

%Subterm function

subterm(Term,Term).
subterm(Sub,Term) :-
    compound(Term), functor(Term,_,N),
    subterm(N,Sub,Term).

subterm(N,Sub,Term) :-
    N > 1, N1 is N-1, subterm(N1,Sub,Term).

subterm(N,Sub,Term) :-
    arg(N,Term,X), subterm(Sub,X).

%Position Function Question 2

position(Sub,Sub,[]).
position(Sub,Term,[N|T]) :-
    compound(Term), arg(N,Term,X),
    subterm(Sub,X), position(Sub,X,T).
