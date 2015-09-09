% First own elaborate test setting:
% try to escape from a houses main floor

% ##############################################################################
% ------------------------     DYNAMIC ENTITIES     ----------------------------
% ##############################################################################

:-dynamic inventory/1. % this 'dynamic list' might be empty
:-dynamic location/2.
:-dynamic next_to/2.
:-dynamic you/1.
:-dynamic ate/1.

:- dynamic closed/2.
:- dynamic closed_look/1.
:- dynamic closed_take/1.
:- dynamic closed_info/1.

% ##############################################################################
% -------------------------       PLACES      ----------------------------------
% ##############################################################################
%
% ---------------------------  Places you can go to  ---------------------------

% You are in the hall in the beginning.
you(hall).

% Which places exist.
place(closet).
place('living room').
place(kitchen).
place('dining room').
place(hall).
place(outside).
place(cellar).
place(void).
place(upstairs).

% Which places are connected.
next_to(hall, kitchen).
next_to(hall, closet).
next_to(hall, 'living room').
next_to(hall, 'dining room').
next_to(hall, outside).
next_to('living room','dining room').
next_to(hall, cellar).
next_to(upstairs, hall).


% ##############################################################################
% ------------------------------     CLOSED       ------------------------------
% ##############################################################################
%
% ----------------  Various definitions of closed states  ----------------------

closed(upstairs, hall).
closed(closet, hall).
closed(outside, hall).
closed(cellar, hall).
closed('living room', hall).
closed('living room', 'dining room').

% Which furniture we can't look into or can't take stuff out of.
closed_look(cupboard).
closed_look(carpet).
closed_look('cellar door').
closed_look(letter).
closed_look('living room door').
closed_look('entrance door').
closed_look(locker).
closed_look(lady).

%closed_take(cupboard).
closed_take(locker).
closed_take(lady).
%closed_take(carpet).

closed_info(cupboard) :-
  write('  The cupboard is locked! Maybe you just need to pull hard enough.').

%closed_look(carpet).

% ##############################################################################
% -------------------------------    ITEMS     ---------------------------------
% ##############################################################################
%
% ------------  Items you can pick up and put in your inventory  ---------------


% ------------------------------------------------------------------------------
% HALL
location(shelf, hall).
location(wardrobe, hall).
location(carpet, hall).
location('closet door', hall).
location('cellar door', hall).
location('living room door', hall).
location('entrance door', hall).
location('stairs, hall').
location(stairs, hall).

%--------------------------------------
%ITEMS IN HALL
location(shoe, shelf).
location(shoehorn, shelf).

location(jacket, wardrobe).
location(coathook, wardrobe).

location(fluff, carpet).
location(dust, carpet).
location('plastic eyeball', carpet).

location('number pad', 'cellar door').

%-------------------------------------------------------------------------------
% KITCHEN:
location(cupboard, kitchen).
location(stove, kitchen).
location(counter, kitchen).

% -------------------------------------
% ITEMS IN KITCHEN
location(spoon, cupboard).
location(mixer, cupboard).
location(sword, cupboard).

location(wire, stove).
location('done chicken', stove).
location('rusty key', stove).

location(fish, counter).
location('purring cat', counter).
location(fork, counter).

%-------------------------------------------------------------------------------
% CLOSET:
location(broom, closet).
location(bucket, closet).


%-------------------------------------------------------------------------------
% DINING ROOM:
location(table, 'dining room').
location(chairs, 'dining room').
location('living room door', 'dining room').

% -------------------------------------
% ITEMS IN DINING ROOM
location(plate, table).
location('table leg', table).

location(pillow, chair).

%-------------------------------------------------------------------------------
% LIVING ROOM:
location(vitrine, 'living room').
location(picture, 'living room').
location(table, 'living room').
location(window, 'living room'). % boarded up (mit brettern vernagelt)
location(armchair, 'living room').
location('leather couch', 'living room').
location('hall door', 'living room').

% ------------------------------------
% ITEMS IN LIVING ROOM
location('small statue', vitrine).

location(painting, picture).
location(letter, picture).

location(magazine, table).

location(glass, window).

location(key, armchair).
location(whip, armchair).

location(leather, 'leather couch').
location('slice of pizza', 'leather couch').


% ------------------------------------------------------------------------------
% CELLAR
location(locker, cellar).

% -------------------------------------
% ITEMS IN CELLAR
location('folded piece of paper', locker).


% ------------------------------------------------------------------------------
% VOID
location(lady, void).



% ##############################################################################
% --------------------------------     FURNITURE     ---------------------------
% ##############################################################################
%
% -------------------------  Things you can't pick up  ------------------------

% ------------------------------------------------------------------------------
% HALL:
furniture(shelf).
furniture(wardrobe).
furniture(carpet).
furniture('living room door').

% ------------------------------------------------------------------------------
% CELLAR DOOR
furniture('number pad').

% ------------------------------------------------------------------------------
% KITCHEN:
furniture(cupboard).
furniture(stove).
furniture(counter).
furniture(mixer).

% ------------------------------------------------------------------------------
% DINING ROOM:
furniture('dining table').
furniture(chairs).

% ------------------------------------------------------------------------------
% LIVING ROOM:
furniture(vitrine).
furniture('small table').
furniture(window).
furniture(armchair).
furniture('hall door').

% ------------------------------------------------------------------------------
% VOID
furniture(lady).

