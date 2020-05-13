% Copyright (c) 2020 Jake Tantorski All Rights Reserved.


month(1, 'January 27th, ').
month(6, 'June 27th, ').
month(7, 'July 27th, ').


testFunction :-
  yearSolver(Year),
  nth0(0, Year, A),
  number_string(A, Str),
  month(1, Month),
  string_concat(Month, Str, TargetDate),
  writeln(TargetDate).

leapYearCheck(Year) :-
  0 is mod(Year, 4),
  not(0 is mod(Year, 100)).

leapYearCheck(Year) :-
  0 is mod(Year, 4),
  not(0 is mod(Year, 100)).

weekendCheck(Year) :- day_of_the_week(date(Year, 1, 27), 6).

weekendCheck(Year) :- day_of_the_week(date(Year, 1, 27), 7).

yearSolver(A) :-
   numlist(1900, 1999, YearRangeList),
   include(test_dates, YearRangeList, A).

test_dates(Year) :-
   Year1 is Year - 8,
   Year2 is Year - 4,
   weekendCheck(Year1),
   day_of_the_week(date(Year, 1, 27), 1),
   leapYearCheck(Year2),
   not(leapYearCheck(Year1)).
