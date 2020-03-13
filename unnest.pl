% Copyright (c) 2020 Jake Tantorski Copyright Holder All Rights Reserved.

compareList([], []).
% comapre the two different lists with eachother
compareList([List1|List1s], [List2|List2s]):-
  % comparitive statement
  List1 = List2,
  compareList(List1s, List2s).

% main function where unnested lists are sent to be comapred in the compareList()
equals([List1|List1s], [List2|List2s]) :-
  % unnest list 1
  unnest_v1([List1|List1s], FlatL1),
  % unnest list 2
  unnest_v1([List2|List2s], FlatL2),
  % call compareList function
  compareList(FlatL1, FlatL2).

% UnnestV1

%Unnest the List
  unnest_v1([],[]).
% append result of flattened list
  unnest_v1([X|Xs],Out) :-
  	unnest_v1(X,FlatX),
  	unnest_v1(Xs,Y),
  	append(FlatX,Y,Out).

%  the head of the input list becomes the head of the output list.
  unnest_v1([X|Xs], [X|Y]) :-
  	X \= [],
  	X \= [_|_],
    unnest_v1(Xs,Y).

% UnnestV2

    unnest_v2(X,Y) :-
    	unnest_v2(X,[],Y).

    % empty list
    unnest_v2([],Acc,Acc).

    % flatten tail of the list
    unnest_v2([Head|Tail],Acc,Y) :-
    	unnest_v2(Tail,Acc,TY),
    	unnest_v2(Head,TY,Y).

    % if the first argument is not a list.
    unnest_v2(X,Acc,[X|Acc]) :-
    	X \= [],
    	X \= [_|_].
