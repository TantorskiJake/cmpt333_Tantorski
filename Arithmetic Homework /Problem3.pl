accLen([_|X],A,L)  :-
  B  is  A+1,
  accLen(X,B,L).
  accLen([],A,A).

leng(List,Length)  :-  accLen(List,0,Length).
