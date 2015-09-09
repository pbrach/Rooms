%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   I N P U T  /  O U T P U T  Clauses
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% return '\n' = 10
% blank   ' ' = 32
% get0 reads first letter of input stream as acsii-number!

%-------------------
% R E A D _ L I N E
%-------------------
% Read every input character until a return statement (10 = \n).
% If the first input is a return, then wait until you get any different
% input.
read_line(String) :-
  get0(InChar),
  not(InChar is 10),
  read_fol(10,InChar,String),!. % if the first input char is different from 10,
                                % then read the line with read_fol/3.

read_fol(StopChar,StopChar,[]). % BASE CASE: stop if you hit the stop char (10)

read_fol(StopChar,InChar,[InChar|RestString]) :-
  get0(NewInChar), %RECURSION read whole line, char by char:
  read_fol(StopChar,NewInChar,RestString).


%-------------------------
% S P L I T _ S T R I N G
%-------------------------
% Split a big list into several smaller lists.
% Split if you find the character SepChar.
% (you will loose SepChar)
split_string(_,[],[]).
split_string(SepChar,CharList,[Chunk|SingleLists]) :-
  get_chunk(SepChar,CharList,Chunk,RestCharList),
  split_string(SepChar,RestCharList,SingleLists).

% Split a big list into a smaller list and a rest-list
% where you can find SepChar.
% SepChar it self is deleted.
get_chunk(_,[],[],[]).
get_chunk(SepChar,[SepChar|RestCharList],[],RestCharList) :- !.
get_chunk(SepChar,[OtherChar|RestCharList],[OtherChar|RestChunk],UnusedCharList) :-
  get_chunk(SepChar,RestCharList,RestChunk,UnusedCharList).


%---------------------------------
% S T R I N G S _ T O _ A T O M S
%---------------------------------
% Transform lists of numbers to to a single list of words
% (retranslates the input ascii numbers)
strings_to_atoms([],[]).
strings_to_atoms([X|Xs],[Y|Ys]) :- name(Y,X), strings_to_atoms(Xs,Ys).


%-----------------
% L O W _ C A S E
%-----------------
% make sure that every word is lower case!
low_case([],[]).
low_case([Up|UpRest],[Low|LowRest]) :- 
  downcase_atom(Up,Low), low_case(UpRest,LowRest).


%----------------------------------
% R M _ W S P   /  R M _ S I G N S
%----------------------------------
% remove leading white spaces:
rm_wsp([32|In], Out) :- rm_wsp(In, Out).
rm_wsp(In, In).

% remove everything that is not a letter or a white space:
rm_signs([],[]).
rm_signs([X|R1],R2) :- not(letter(X)),rm_signs(R1,R2).
rm_signs([Y|R1],[Y|R2]) :- rm_signs(R1,R2).

% definition of allowed characters (other chars will be filtered out):
letter(X) :- X >= 97, X =< 122. % X is a letter from a to z
letter(X) :- X >= 65, X =< 90.  % X is a letter from A to Z
letter(X) :- X >= 48, X =< 57.  % X is a digit from 0 to 9
letter(X) :- X == 32.  % X is a white space
letter(X) :- X == 45.  % X is a minus-sign



%---------------------------
% R E A D _ S E N T E N C E
%---------------------------
% Read a user sentence.
% (Output 'Sentence' will be a list of atoms)
read_sentence(Sentence) :-
  write('> '),
  read_line(Str1),      % read user input
  rm_wsp(Str1, Str2),   % remove leading white spaces
  rm_signs(Str2,Str3),  % remove everything that is not an allowed character (like: !,¤,$,%,&,.,*,#,?,=)
  split_string(32, Str3, Words), % split the input at white spaces (32 is a white space)
  strings_to_atoms(Words,UpSentence), % transform the number list back to text (to atoms)
  low_case(UpSentence, Sentence),!.   % transform all upper case letters to lower case letters!




%-----------------------
% R E A D _ N U M B E R
%-----------------------
% for reading a number of a specific length,
% generating the corresponding input and using get_number:
read_number(Number,Length) :-
  respond([' Please enter a ',Length, ' digit number:']),
  get_number(Number).
  
% simplified read_sentence
% for reading numbers:
get_number(InNum3):-
  read_line(InNum1),
  rm_num(InNum1, InNum2),
  name(InNum3,InNum2).

% remove everything that is not a digit:
rm_num([],[]).
rm_num([X|R1],R2) :- not(numb(X)),rm_num(R1,R2).
rm_num([Y|R1],[Y|R2]) :- rm_num(R1,R2).

numb(X) :- X >= 48, X =< 57.  % X is a digit from 0 to 9

