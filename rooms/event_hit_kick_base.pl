%###############################################################################
% ------     What happens if you kick, hit, or hit smth with smth     ----------
%###############################################################################

single_event(hit, 'closet door') :-
  ate(stronger),
  open_room(closet),
  retract(location('closet door', hall)),
  write('  Good thing you are something. You''re so strong, just looking'),nl,
  write('  at the door makes it afraid, and it opens voluntarily.'),nl.

single_event(hit, 'closet door') :-
  write('  Getting angry because you can''t open the door, you hit it with your'),nl,
  write('  fist. Unfortunately your handy are tiny and not strong enough.'),nl.

single_event(kick, 'closet door') :-
  open_room(closet),
  retract(location('closet door', hall)),
  write('  Screaming, you run at the closet door, trying to dropkick it open.'),nl,
  write('  Good, thing it''s a weak wooden door, so you succeed. The door is'),nl,
  write('  open now.'),nl.

event(hit, shoe, 'closet door') :-
  write('  You hit the door with a shoe. Genius...'),nl.

event(hit, 'table leg', 'closet door') :-
  inventory('table leg'),
  open_room(closet),
  retract(location('closet door', hall)),
  write('  You hit the closet door with the table leg. You hit it again.'),nl,
  write('  And again, and again...and again. And finally it breaks apart.'),nl.

event(hit, 'small statue', 'closet door') :-
  inventory('small statue'),
  open_room(closet),
  retract(location('closet door', hall)),
  write('  You hit the closet door with the small statue. You hit it again.'),nl,
  write('  And again, and again...and again. And finally it breaks apart.'),nl.

event(hit, 'closet door', sword) :-
  inventory(sword),
  open_room(closet),
  retract(location('closet door', hall)),
  write('  You hit the closet door with the sword. You hit it again.'),nl,
  write('  And again, and again...and again. And finally it breaks apart.'),nl.
