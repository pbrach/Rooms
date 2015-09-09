%###############################################################################
% --------------------------     Open smth (with smth)     ---------------------
%###############################################################################


event(open, key, 'closet door') :-
  retract( inventory(key) ),
  retract( location('closet door', hall) ),
  open_room(closet),
  write('  You unlock the closet door with the key and open the door.'),nl.


event(open, 'rusty key', 'living room door') :-
  retract(inventory('rusty key')),
  retract(location('living room door', hall)),
  retract(location('hall door', 'living room')),
  open_room('living room'),
  write('  Slowly you slide the rusty key into the keyhole, and turn it around.'),nl,
  write('  Suddenly, the key disappears into thin air, and the door forms a big'),nl,
  write('  mouth laughing at you, as it slowly fades away.'),nl.


single_event(open, 'living room door') :-
  write('  You can''t open it, it''s closed, silly.').

%-------------------------------------------------------------------------------
% CARPET
single_event(pull, carpet) :-
  retract(closed_take(carpet)),
  write('  You pull the carpet out of the way and discover some nice items.'),nl.


single_event(open, letter) :-
  retract(inventory(letter)),
  asserta(inventory('open letter')),
  write('  You scratch off the wax stamp, and open the letter. This is what it says:'),nl,
  description('open letter').


% ------------------------------------------------------------------------------
% CELLAR DOOR

single_event(pull, 'cellar door') :-
  open_room(cellar),
  retract( location('cellar door', hall) ),
  retract( location('number pad', 'cellar door') ),
  write('  You put your hands inside the tiny cracks in the door and pull...'),nl,
  write('  you pull like there is no freaking tomorrow. After 5 minutes of'),nl,
  write('  pulling it finally is open and you can go to the cellar.'),nl.

single_event(open, 'cellar door') :-
  open_room(cellar),
  retract( location('cellar door', hall) ),
  retract( location('number pad', 'cellar door') ),
  write('  You put your hands inside the tiny cracks in the door and pull...'),nl,
  write('  you pull like there is no freaking tomorrow. After 5 minutes of'),nl,
  write('  pulling it finally is open and you can go to the cellar.'),nl.

