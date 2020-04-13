interval(Day1, Day2, N) :-
    dayYear(Day1, N1),
    dayYear(Day2, N2),
    N is N2 - N1.

dayYear(Day-Month, N) :-
    month(Month, M),
    M1 is M - 1,
    numDaysInMonth(Ds),
    sumOf(M1, Ds, S),
    N is S + Day.

sumOf(0, _, 0) :- !.
sumOf(N, [Head|Tail], Sum) :-
    N1 is N - 1,
    sumOf(N1, Tail, Sum1),
    Sum is Sum1 + Head.

month(january, 1).
month(february, 2).
month(march, 3).
month(april, 4).
month(may, 5).
month(june, 6).
month(july, 7).
month(august, 8).
month(september, 9).
month(october, 10).
month(november, 11).
month(december, 12).

numDaysInMonth(X) :- X = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].
