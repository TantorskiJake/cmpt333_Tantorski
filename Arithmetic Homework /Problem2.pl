triangle(N,F) :-
  triangle(N,0,F).

triangle(N,T,F) :-
  N > 0,
  T1 is T+N,
  N1 is N-1,
  triangle(N1,T1,F).

  triangle(0,F,F).
