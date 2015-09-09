%%%%%%%%%%%%%%%%%%%%
%    P A R S E R
%%%%%%%%%%%%%%%%%%%%
%
% a simple english parser to translate a given list of atoms to
% a action command 'rooms' can understand (see actions_mod)
%
% The parser understands commands like:
% [go, to, roomX]        -> goto(roomX)
% [open, door X with Y]  -> use_with1(open, X, Y)
% [combine X with the Y] -> combine(X, Y)
% [take X]               -> take(X)
% [help]                 -> help
%
% The basic concept for this parser originates from
% Amzi-Prolog's 'Nani Search', which can be found here:
% http://www.amzi.com/AdventureInProlog/appendix.php
% but we made a lot of additions to parse more complex
% commands as use X with Y and so on.

%-----------------------
% G E T _ C O M M A N D
%-----------------------
% takes an atom sentence like: [command, in, arg1, connector, determiner, arg2]
% as input and:
% uses parse to transform that list to [command, arg1, arg2]
% and changes that list to: command(arg1, arg2).
get_command(X, Sen):-
  parse(Par,Sen,[]),    % call the grammar for command
  X =.. Par,!.          % make the command list a structure
get_command(_, _):-
  write('I don''t understand, try again or type help'),nl,fail.



%-----------
% P A R S E
%-----------
%
% for combine + put in:
parse([Command, Arg1, Arg2]) --> verb_use(item,Command),
                                 nounphrase(item,Arg1),conec,
                                 nounphrase(item,Arg2).
% for use_with1:
parse([use_with1, Opt, Arg1]) --> verb_use1(item, use_with1, Opt), conec,
                                  nounphrase(item, Arg1).

parse([use_with1, Opt, Arg1]) --> verb_use1(item, use_with1, Opt),
                                  nounphrase(item, Arg1).

% for use_with2:
parse([use_with, Opt, Arg1, Arg2])  --> verb_use2(item, use_with, Opt),
                                        nounphrase(item, Arg1),conec,
                                        nounphrase(item, Arg2).

parse([use_with, Opt, Arg1, Arg2])  --> verb_use2(item, use_with, Opt),
                                        nounphrase(item, Arg1),
                                        nounphrase(item, Arg2).

parse([Command,Arg])       --> verb(Type,Command),nounphrase(Type,Arg).
parse([goto,Arg])          --> noun(go_place,Arg).
parse([Command])           --> verb(intran,Command).



%-------------------------
% V E R B s:
%-------------------------
%
% here we need to specify most verbs.
% we map some words to specific actions like
% use_with, combine, goto, etc...
verb_use1(item, use_with1, Arg1) --> use1_verb(use_with1, Arg1).
verb_use2(item, use_with, V)     --> use2_verb(use_with, V).
verb_use(item, V)                --> use_verb(V).

verb(go_place,goto) --> go_verb.
verb(item,V)        --> tran_verb(V).
verb(go_place,V)    --> tran_verb(V).
verb(intran,V)      --> intran_verb(V).


go_verb --> [go,to].
go_verb --> [goto].
go_verb --> [go].
go_verb --> [g].


use1_verb(use_with1, open)   --> [open].
use1_verb(use_with1, pull)   --> [pull].
use1_verb(use_with1, use)    --> [use].
use1_verb(use_with1, use)    --> [jump].
use1_verb(use_with1, use)    --> [get].
use1_verb(use_with1, kick)   --> [kick].
use1_verb(use_with1, hit)    --> [hit].
use1_verb(use_with1, eat)    --> [eat].
use1_verb(use_with1, unfold) --> [unfold].
use1_verb(use_with1, burn)   --> [burn].
use1_verb(use_with1, talk)   --> [talk].
use1_verb(use_with1, fart)   --> [fart].
use1_verb(use_with1, stroke) --> [stroke].
use1_verb(use_with1, pet)    --> [pet].



use2_verb(use_with, use) --> [use].
use2_verb(use_with, use) --> [show].
use2_verb(use_with, use) --> [give].
use2_verb(use_with, hit) --> [hit].
use2_verb(use_with, throw) --> [throw].
use2_verb(use_with, open) --> [open].
use2_verb(use_with, burn) --> [burn].


use_verb(combine)  --> [combine].
use_verb(put_in)   --> [put].

tran_verb(take) --> [take].
tran_verb(take) --> [pick, up].
tran_verb(take) --> [pick].

tran_verb(unlock) --> [unlock].

tran_verb(look_in) --> [look, in].
tran_verb(look_in) --> [what, is, on].
tran_verb(look_in) --> [look, into].

tran_verb(detail_look) --> [look, at].
tran_verb(detail_look) --> [details, about].
tran_verb(detail_look) --> [details].
tran_verb(detail_look) --> [details, of].
tran_verb(detail_look) --> [detail].
tran_verb(detail_look) --> [describe].
tran_verb(detail_look) --> [look, closer, at].
tran_verb(detail_look) --> [take, a, closer, look, at].


intran_verb(quit) --> [quit].
intran_verb(quit) --> [bye].
intran_verb(quit) --> [good, bye].
intran_verb(quit) --> [exit].

intran_verb(help) --> [help].

intran_verb(look) --> [look].
intran_verb(look) --> [look, around].

intran_verb(inventory) --> [i].
intran_verb(inventory) --> [inventory].
intran_verb(inventory) --> [list, items].
intran_verb(inventory) --> [items].
intran_verb(inventory) --> [show, items].
intran_verb(inventory) --> [show, inventory].



%-------------------------------------
% N O U N s   &   N O U N P H R A S E
%-------------------------------------
nounphrase(Type,Noun) --> noun(Type,Noun).
nounphrase(Type,Noun) --> det,noun(Type,Noun).

% nouns are places:
noun(go_place,X) --> [X],{place(X)}.
% if a place name consists of two words:
noun(go_place,'dining room') --> [dining,room].
noun(go_place,'living room') --> [living,room].

% nouns are items (with a location or in the inventory)
noun(item,X) --> [X],{location(X,_);inventory(X)}.
% item names that consist of two words need to extra defined:
noun(item, 'closet door')       --> [closet, door].
noun(item, 'leather couch')     --> [leather, couch].
noun(item, 'purring cat')       --> [purring, cat].
noun(item, 'table leg')         --> [table, leg].
noun(item, 'burning torch')     --> [burning, torch].
noun(item, 'burned fish')       --> [burned, fish].
noun(item, 'cellar door')       --> [cellar, door].
noun(item, 'number pad')        --> [number, pad].
noun(item, 'open letter')       --> [open, letter].
noun(item, 'living room door')  --> [living, room, door].
noun(item, 'hall door')         --> [hall, door].
noun(item, 'rusty key')         --> [rusty, key].
noun(item, 'fluffy shoe')       --> [fluffy, shoe].
noun(item, 'shoe on a wire')    --> [shoe, on, a, wire].
noun(item, 'entrance door')     --> [entrance, door].
noun(item, 'creepy looking shoehorn') --> [creepy, looking, shoehorn].
noun(item, 'folded piece of paper')   --> [folded, piece, of, paper].
noun(item, 'unfolded piece of paper') --> [unfolded, piece, of, paper].
noun(item, 'fluffy-stuffed chicken')  --> ['fluffy-stuffed', chicken].
noun(item, 'small statue')  --> [small, statue].
noun(item, 'slice of pizza')  --> [slice, of, pizza].
noun(item, 'small table')  --> [small, table].
noun(item, 'dining table')  --> [dining, table].


%-------------------------
% CONNECTORs & DETERMINER:
%-------------------------
%
% here they do not convey any meaning, so the stay argumentless
conec --> [with].
conec --> [on].
conec --> [in].
conec --> [into].
conec --> [at].
conec --> [and].
conec --> [to].

det --> [a].
det --> [the].
