log :-
  write('Input file destination: '),
  read(File),
  write(S),
  shell(log,File).

shell(Flag,File) :-
  shell_prompt,
  shell_read(Goal,Flag,File),
  shell(Goal,Flag,File).

shell(exit,Flag, File) :-
  close_logging_file(File).

shell(nolog,Flag,File) :-
  shell(nolog).

shell(log,Flag,File) :-
  shell(log,File).

shell(Goal,Flag,File) :-
  ground(Goal),!,
  shell_solve_ground(Goal,Flag,File),
  shell(Flag,File).

shell(Goal,Flag,File) :-
  shell_solve(Goal,Flag,File),
  shell(Flag,File).

shell_solve(Goal,Flag,File) :-
  Goal,
  shell_write(Goal,Flag,File),nl,
  fail.

shell_solve(Goal,Flag,File) :-
  shell_write('No (more) solutions',Flag, File),nl.

shell_solve_ground(Goal,Flag,File) :-
  Goal,!,
  shell_write('Yes',Flag,File),nl.

shell_solve_ground(Goal,Flag,File) :-
  shell_write('No',Flag,File),nl.

shell_prompt :-
  write('Next command?').

shell_read(X,log,File) :-
  read(X),
  file_write(['Next command? ',X],File).

shell_read(X,nolog) :-
  read(X).

shell_write(X,nolog) :-
  write(X).

shell_write(X,log,File) :-
  write(X),
  file_write(X, File).

file_write(X,File) :-
  write_term(File,Term,[ ]).

close_logging_file(File) :-
  close(File).
