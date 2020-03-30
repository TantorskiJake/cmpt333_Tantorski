triangle(N,F) :-
  N > 0,
  N1 is N-1,
  triangle(N1, F1),
  F is N+F1.

triangle(0,0).
