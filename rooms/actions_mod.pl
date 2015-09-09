%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A C T I O N S   M O D U L E :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Enables the user to perform standard actions as:
% look, 
% take, 
% use, 
% combine, 
% go to
%
% Those actions define the frame work of the game.
% Some of them were expanded/overloaded to
% enable even more specific actions, based
% on those standard actions.
% (e.g.: look, look_at, look_in, OR:
% use, hit, kick, talk, eat, open...)
%
% Some code fragments and concepts originate from
% Amzi-Prolog's 'Nani Search', which can be found here:
% http://www.amzi.com/AdventureInProlog/appendix.php
%
% In 'rooms' we added some interesting actions to increase 
% the complexity of the game. So it is possible
% to have locked boxes, combine items and use items.
% The implementation of events and descriptions is 
% our major addition to massively broaden the
% amount of possible ways to interact with the game
% world, and to be able to easily add a lot of game
% content.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% respond simplifies writing a mixture of literals and variables
% (This is a code snippet from amzi-prolog)
respond([]):-
  nl,nl.
respond([H|T]):-
  write(H),
  respond(T).



%-----------------
%     H E L P
%-----------------
%
% Gives the user general instructions on how to control 'rooms':
help :-
  nl,nl,nl,nl,
  write('Use simple English sentences to enter commands.'),nl,
  write('You should always start with a verb and connect'),nl,
  write('it with some object:'),nl,
  nl,
  write('   go to <room name>     (ex. go to the kitchen)'),nl,
  write('   look around                                 '),nl,
  write('   look in <something>   (ex. look in the desk)'),nl,
  write('   look at <something>   (ex. look at the door)'),nl,
  write('   take <something>        (ex. take the apple)'),nl,
  write('   show inventory                              '),nl,
  write('   use <something>'),nl,
  write('   use <something> with <another thing>'),nl,
  write('   combine <something> with <another thing>'),nl,
  nl,
  write('   Other verbs could be: open, hit, kick, burn, eat, fart, talk,'),nl,
  write('                         pull, unfold, give, put, jump'),nl,
  nl,
  write('   To exit the game type: quit'),nl,
  nl,
  nl,
  write('Hit enter to continue.'),nl,
  get0(_).




%-----------------
%     L O O K
%-----------------
%
% Generate a feedback for the user.
% List the items in the room and the rooms that are near by.
% (taken from Amzi-Prolog, modified)
%
%
look :-
  you(Here),
  respond(['You are in the ',Here]),
  write('You can see the following things:'),nl,
  list_items(Here),nl,
  write('The following rooms are nearby:'),nl,
  list_connections(Here).

% lists all items that are in the room
list_items(Place):-
  location(X,Place), % This won't list items that are in items.
  tab(2),write(X),nl,
  fail.
list_items(_).

% list all rooms that are nearby:
list_connections(Place):-
  connect(Place,X),
  tab(2),write(X),nl,
  fail.
list_connections(_).




% L O O K _ I N 
%---------------
% allows the player to look inside a thing which might
% contain other things
% (taken from Amzi-Prolog, modified)

% if the user wants to look into the current room execute look!
look_in(Thing):-
  place(Thing),
  you(Thing),
  look.

% if the user wants to look into another room give error:
look_in(Thing):-
  place(Thing),
  not(you(Thing)),
  write('  You have to go there first'), nl.

% if the thing to look into is not where the user is:
look_in(Thing):-
  you(Here), % check if the thing to look into is where you are
  not(location(Thing,Here)),
  respond(['  There is no ',Thing, ' here']).

% looks into a thing. If it is closed, gives a description to the closed state.
look_in(Thing):-
  closed_look(Thing),       % check if it is possible to look into the thing
  respond(['  You can''t look into it.']).

% Successful look_in:
look_in(Thing):-
  location(_,Thing),               % make sure there's at least one
  write('The '),write(Thing),write(' contains:'),nl,
  list_items(Thing).

look_in(Thing):-
  respond(['  There is nothing in the ',Thing]).




% D E T A I L _ L O O K 
%-----------------------
% detail_look gives a detailed description of an item in the inventory
% or in the current room if the item is not in an other item that was
% defined as closed_look(item).
% The descriptions can be found in the descriptions_base.
%
% Catch some special case exceptions:
detail_look('number pad'):-
  describe('number pad').
detail_look(carpet) :-
  describe(carpet).

% if the thing is in the inventory: describe it:
detail_look(Thing):-
  inventory(Thing),
  describe(Thing).

% if the thing to look at is a not closed_look box
% describe it and list its contents
detail_look(Thing):-
  location(_,Thing),
  you(Here),
  is_in(Thing,Here,Box),
  not(closed_look(Box)),
  describe(Thing),
  list_on(Thing).

% if the thing is in the room or within a not closed_look box of that room
% describe it
detail_look(Thing):-
  you(Here),
  is_in(Thing,Here,Box),
  ( not(closed_look(Box));location(Thing,Here) ),
  describe(Thing).

% if the thing is within a closed_look box:
detail_look(Thing):-
  you(Here),
  is_in(Thing,Here,Box),
  closed_look(Box),
  respond([' You can''t see anything through that ',Box]).

% if none of the other cases match:
detail_look(Thing):-
  respond([' There is no ',Thing,' here.']).



% Describe either by telling the description...
describe(Thing):-
  description(Thing).
% ...or if none exists by saying it is a normal thing
describe(Thing):-
  respond(['  That''s a totally normal ',Thing]).

% list things that are in a not closed_look box:
list_on(Box):-
  respond(['  You can see the following things on the ',Box ,' :']),
  list_items(Box).




%-----------------
%     G O T O
%-----------------
%
% The code was taken from Amzi-Prolog and some additions were made.
% this action enables to change the you(X) state, which defines the user
% location.

% is it possible to enter the other room?
connect(X, Y) :- next_to(X, Y).
connect(X, Y) :- next_to(Y, X).

% is a specific connection locked?
locked(X, Y):- closed(X, Y).
locked(X, Y):- closed(Y, X).

% if you are already there:
goto(X):-
  you(X),
  write('  You are already in the '), write(X), nl.

% Special case. If you go outside don't look around.
goto(X) :-
  you(L),
  connect(L, X),
  not(locked(L, X)),
  X = outside,
  retract( you(L) ),
  assert( you(X) ).

goto(X) :-
  you(L),
  connect(L, X),     % check if the rooms are connected
  not(locked(L, X)), % check if the door is unlocked
  retract( you(L) ), % change...
  assert( you(X) ),  % ...user location
  look.              % 'look around'

% if rooms are connected but the door locked:
goto(X) :-
  you(L),
  connect(L, X),
  locked(L, X),
  respond([' The door to the ',X,' is locked!']).

% the last case is only called if the rooms are not connected:
goto(_) :-
  write('  You can''t get there from here. '), nl.





%-----------------
%     O P E N:
%-----------------
%
% We want to open a door or a box under defined and individual
% conditions that are defined in a event or single_event clause.
% For that reason these clauses are not directly callable by the user.
% So these clauses change the state of the defined open/close state
% of rooms or boxes. Checks are not implemented since open is
% called in an event/single_event and the programmer can make sure
% that it is possible to perform the action
%
% OPENS a ROOM/DOOR
open_room(X):-
  you(Y),
  open_xy(X,Y).
% retract the closed fact for the connection
open_xy(X, Y):-
  closed(X, Y),
  retract(closed(X, Y)).
open_xy(X, Y):-
  closed(Y, X),
  retract(closed(Y, X)).


% OPENS a BOX/FURNITURE:
% retract the closed fact for the BOX
open_box(X):-
  retract(closed_look(X)),fail; % retract if a closed_look did exist
  retract(closed_take(X)),fail; % retract if a closed_take did exist
  retract(closed_info(X));true. % retract if a closed_info did exist


%---------------
% T A K E
%---------------
% (Part from Amzi-Prolog:)
% 'Take' allows the player to take something. As long as the thing is
% contained in the room it can be taken, even if the adventurer hasn't
% looked in the the container which contains it.  Also the thing
% must not be furniture.
% The feature was added that it is not possible to take things that
% are in a locked box

take(Thing):-
  is_here(Thing),
  is_takable(Thing),
  move(Thing),
  respond(['  You now have the ',Thing,'.']).

% Help predicates:
%------------------
% checks if a thing is in the current room
is_here(Thing):-
  you(Here),
  is_in(Thing,Here,_),!.          % don't backtrack
is_here(Thing):-
  respond(['  There is no ',Thing,' here.']),
  fail.

% recursive definition to find
% things contained in things etc.
% and get the name of the Container 'In'
is_in(Thing,Here,In):-
  location(Thing,Here),
  In = Thing.
is_in(Thing,Here,In):-
  location(Thing,X),
  is_in(X,Here,In).

% check if a thing can be taken
is_takable(Thing):-               
  furniture(Thing), % furniture attribute marks untakable things
  respond(['  You can''t pick up a ',Thing]),
  !,fail.

% if the thing is generally takeable check also if it is in something that
% is closed:
is_takable(Thing):-
  you(Here),
  is_in(Thing,Here,Box),
  not(closed_take(Box)).

% give error if you can't get something that is locked away:
is_takable(Thing):-
  you(Here),
  is_in(Thing,Here,Box),!,
  closed_take(Box),          % you can't take things that are locked away
  not(closed_info(Box)),     % if a standard message does not exist: 
  respond(['  You can''t get the ',Thing]), % write: 'You can't get the...'
  !,fail.

% if none of the fail conditions match, it is takeable:
is_takable(_).             



% execute the take process by removing the thing from its old
% location an adding it to the inventory:
move(Thing):-
  you(Here),
  retract(location(Thing,Here)),      % take it from its old place
  asserta(inventory(Thing)).       % and add to your possessions

% take execution for things that are contained in some other thing X
move(Thing):-
  you(Here),
  location(Thing,X),
  is_in(X,Here,_),
  retract(location(Thing,X)),      % take it from its old place
  asserta(inventory(Thing)).       % and add to your possessions



%---------------
% C O M B I N E
%---------------
%
% The user may combine some predefined takeable things.
% For that the two things need to be in the inventory.
% A fitting 'combines_to' clause defines what happens
% if thing 1 and 2 are combined.

% Check if a combination given by the user exists.
% That is the case if any of the combinations combines_to(T1,T2) 
% or combines_to(T2,T1) exist 
% (here we use clause/2 for checking, because combines_to are clauses)
does_combine(Thing1, Thing2):-
  clause(combines_to(Thing1, Thing2),_);
  clause(combines_to(Thing2, Thing1),_).

% execute a combination
perform_combi(Thing1,Thing2):-
  combines_to(Thing1, Thing2);
  combines_to(Thing2, Thing1).
% NOTE: this problem could be differently solved as in 'use_with'

% pretest: do you have the items???
combine(Thing1, _) :-
  not(inventory(Thing1)),
  respond(['  But you don''t have the ',Thing1]).
combine(_, Thing2) :-
  not(inventory(Thing2)),
  respond(['  But you don''t have the ',Thing2]).

% do the combination:
combine(Thing1, Thing2) :-
  inventory(Thing1),
  inventory(Thing2),
  does_combine(Thing1, Thing2),
  perform_combi(Thing1,Thing2).
% error if that combination, does not exist
combine(_, _) :-
  write('  Why the hell would you do that?'), nl.




%---------------------
%   U S E _ W I T H 1
%---------------------
%
% Use ONE thing that is in the inventory or in the room.
% Using calls a 'single_event' that was predefined for
% using that thing.

% check if the thing is in the current room
% or in the inventory
use_with1(_,Thing1) :-
  not(  inventory(Thing1); ( you(Here),is_in(Thing1, Here,_) ) ),
  respond(['  The ', Thing1, ' is not here!']).

% if the pre conditions are full filled
% execute the corresponding single_event:
use_with1(Opt, Thing1) :-
  single_event(Opt, Thing1).

% if it was not possible to execute the single_event
% it did not exist:  
use_with1(_, _) :-
  respond(['  No, you can''t do that! ']).

% Note: it is also possible to check for the existence of a clause
% with clause(single_event(Opt, Thing1), _)
% if single_event(Opt, Thing1) exists, then _ will be unified with the
% body of that clause, but the body won't be executed which is helpful




%------------------
%  U S E _ W I T H 
%------------------
%
% For using one thing with another one. One of the things is
% a item in the user inventory, while the other one is a
% furniture like (untakeable) object in the game world.
% As in use_with1, a 'event' fitting to the to things is called
% as the result of this action.
%
% Several pre checks are needed here, because
% we don't want to restrict the order in which
% user has to name things.

% check if the user wants to use two inventory items with each other...
use_with(_, Thing1, Thing2) :-
  inventory(Thing1),
  inventory(Thing2), % ...if so, recommend to use combine 
  respond([' Using won''t work, but you might be able to combine the items!']).

% if none of the things is in the inventory or the current room...
use_with(_, Thing1, Thing2) :-
  you(X), 
  not(inventory(Thing1)),
  not(inventory(Thing2)),
  not(location(Thing1,X)),
  not(location(Thing2,X)),
  respond([' Nothing of that is around!']).

% if the first thing is in your inventory but the other one not in the room... 
use_with(_, Thing1, Thing2) :-
  inventory(Thing1),
  you(X),
  not(location(Thing2,X)),
  respond(['  But there is no ',Thing2, ' here']).
  
% if the second thing is in your inventory but the other one not in the room... 
use_with(_,Thing1, Thing2) :-
  inventory(Thing2),
  you(X),
  not(location(Thing1,X)),
  respond(['  But there is no ',Thing1, ' here']).
  
% if the second thing is in the room, but the other one not in the inventory... 
use_with(_, Thing1, Thing2) :-
  you(X),
  location(Thing2,X),
  not(inventory(Thing1)),
  respond(['  But you don''t have the ',Thing1]).

% if the first thing is in the room, but the other one not in the inventory... 
use_with(_, Thing1, Thing2) :-
  you(X),
  location(Thing1,X),
  not(inventory(Thing2)),
  respond(['  But you don''t have the ',Thing2]).

% If pre conditions are full filled execute the corresponding event
% in the given order of things, or in the inverse order
% (if the event was defined for another order)
use_with(Opt, Thing1, Thing2) :-
  (event(Opt, Thing1, Thing2); event(Opt, Thing2, Thing1)).

% if it was not possible to call the event
% it did not exist:
use_with(Opt, Thing1, Thing2) :-
  respond(['  You can''t ', Opt,' ',Thing1, ' with ', Thing2]).




%-------------
% P U T _ I N
%-------------
% For putting items in a box like furniture or lay something
% down.

put_in(Thing1, Thing2) :-
  inventory(Thing1),
  you(X),
  not(location(Thing2,X)),
  respond(['  There is no ', Thing2, ' in here.']).

put_in(Thing1, Thing2) :-
  you(X),
  location(Thing2,X),
  not(inventory(Thing1)),
  respond(['  You need to get the ',Thing1, ' first, silly.']).

put_in(Thing1, Thing2) :-
  inventory(Thing1),
  retract(inventory(Thing1)),
  asserta(location(Thing1, Thing2)),
  respond(['  You put the ', Thing1, ' in the ', Thing2, '.']).

put_in(Thing1, Thing2) :-
  respond(['  You can''t put the ', Thing1, ' in the ', Thing2, '.']).





%-------------------------
% (show) I N V E N T O R Y
%-------------------------
% inventory lists items the user has.
% The code is from Amzi-Prolog and is mostly unchanged.
inventory:-
  inventory(_),                   % if you have at least one thing:
  write('You have: '),nl,         % call 'list_possessions'
  list_possessions.
inventory:-                       % otherwise respond: 
  write('  You have nothing'),nl. % 'you have nothing'

list_possessions:-      % due to the standard fail, every item in
  inventory(X),         % 'inventory' will be printed out!
  tab(2),write(X),nl,
  fail.
list_possessions.       % due to this line, the predicate will always be true




%---------------
% D O (actions) 
%---------------
% (connects actions to the parser/get_command)
% The do predicate allows us to specify which
% predicates may be called by the user. We
% do not wish to enable the user to (accidentally
% or willingly) call sub-predicates of actions 
% like 'list_possessions' from the user input line.
%-------------------------------------------------
do(inventory):-inventory,!.
do(goto(X)):- goto(X),!.
do(take(X)):- take(X),!.
do(ope(X)):- ope(X),!.
do(unlock(X)):- unlock(X),!.
do(quit) :- quit,!.
do(look):- look,!.
do(help):- help,!.
do(look_in(X)):- look_in(X),!.
do(detail_look(X)):- detail_look(X),!.
do(combine(X, Y)) :- combine(X, Y),!.
do(use_with(X, Y, Z)) :- use_with(X, Y, Z),!.
do(use_with1(X,Y)) :- use_with1(X,Y),!.
do(put_in(X, Y)) :- put_in(X, Y),!.



