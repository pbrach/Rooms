% ##############################################################################
% --- Descriptions for everything in the world you can see and interact with ---
% ##############################################################################

% HALL:
description(stairs) :-
  write('  3.9 stairs. Dusty, dirty. But nothing else special about them.'),nl.

description(carpet):-
  write('  4.1 very old, worn out, grey carpet. Stinks like'),nl,
  write('  some animal died here a few weeks ago. Strangely, there'),nl,
  write('  are these things on it: '),nl,nl,
  list_items(carpet).

description(shelf) :-
  write('  You can see your face in the dusty reflection in'),nl,
  write('  the glass. There might be something usefull in here.'),nl.

description(wardrobe) :-
  write('  Some old leather jackets and boots. Looks like they'),nl,
  write('  haven''t been used in a while.'),nl.

description('closet door'):-
  write('  An old, wooden door. Looks like you could easily'),nl,
  write('  break it down with some kind of tool.'),nl.

description('cellar door') :-
  write('  Masive metal door of over 9000 tons!!!!'),nl,
  write('  Also, there is a number pad on it, with a blinking red light.'),nl,nl.

description('number pad') :-
  write('  Green screen, saying ''Try me...'),
  counter(X),
  write(X),
  write(''' with a blinking red light next to it.'),nl.

description('entrance door') :-
  write('  Looks like a regular door.'),nl.

%-------------------------------------------------------------------------------
% KITCHEN

description(cupboard) :-
  write('  Some 80''s cupboard, nothing special about it'),nl.

description(stove) :-
  write('  Rusty, old, and missing one button. But maybe you can'),nl,
  write('  use it for baking something.'),nl.

description(counter) :-
  write('  A few drawers are missing, perhaps some bum needed spoons'),nl,
  write('  and forks.'),nl.


%-------------------------------------------------------------------------------
% DINING ROOM

description(table) :-
  write('  A large table with 8 chairs. 1 plate is in the middle,'),nl,
  write('  waiting to be filled.'),nl.

description(chairs) :-
  write('  1.8 chairs at the table. They look pretty clean which is'),nl,
  write('  strange, since this place seems deserted.'),nl.


%-------------------------------------------------------------------------------
% LIVING ROOM

description(vitrine) :-
  write('  Pretty old, but beautiful vitrine.'),nl.

description(painting) :-
  write('  A completely white painting, with a red dot in the lower'),nl,
  write('  right corner. The frame is wooden, and dusty like the'),nl,
  write('  whole place.'),nl.

description(table) :-
  write('  Small couch-table. Some magazines on it. Strangely even'),nl,
  write('  an empty cup.'),nl.

description(window) :-
  write('  2.1 window boarded up window. Dusty, broken glass. Seems like someone'),nl,
  write('  wanted to keep something out of here...or in here.'),nl.

description(armchair) :-
  write('  Pretty neat chair. Looks very comfy?'),nl.

description('leather couch') :-
  write('  Cold, brown leather. Could use some cleaning.'),nl.

% ------------------------------------------------------------------------------
% CELLAR

description(locker) :-
  write('  A dirty, old school locker.'),nl.


% ------------------------------------------------------------------------------
% VOID

description(lady) :-
  write('  A lady dressed in white. You almost didn''t realize she was here'),nl,
  write('  with all the white color around.'),nl.


% ##############################################################################
% ----------     Descriptions for every item you can pick up     ---------------
% ##############################################################################

% SHELF

description(shoe) :-
  write('  Stinky, black shoes.'),nl.

description(shoehorn) :-
  write('  Neat, little shoehorn. Perfect for scratching your back.'),nl.

%-------------------------------------------------------------------------------
% WARDROBE

description(jacket) :-
  write('  An old jacket. Just like the other ones.'),nl.

description(coathook) :-
  write('  Simple coathook. DIY abortion-tool.'),nl.


%-------------------------------------------------------------------------------
% CARPET

description(fluff) :-
  write('  Some fluff. Tickels in your nose.'),nl.

description(dust) :-
  write('  Doesn''t taste as good as sand, but looks nicer.'),nl.

description('plastic eyeball') :-
  write('  Whoever left it here must miss one eye. Looks creepy.'),nl.


%-------------------------------------------------------------------------------
% CLOSET

description(broom) :-
  write('  Dirty, old broom. You get a strange feeling in your hand when you'),nl,
  write('  look at it.'),nl.

description(bucket) :-
  write('  You look into the bucket and see n0thing but pure darkness. Even'),nl,
  write('  with the lights on. Strange.'),nl.


%-------------------------------------------------------------------------------
% CUPBOARD

description(spoon) :-
  write('  Were you born with a silver spoon in your mouth?'),nl.

description(mixer) :-
  write('  Might be the only electronically powered device around here.'),nl.

description(sword) :-
  write('  Well...Maybe there''s a dragon in here somewhere.'),nl.


%-------------------------------------------------------------------------------
% STOVE

description(wire) :-
  write('  Now you just need a pen and you can be McGyver!'),nl.

description('done chicken') :-
  write('  Looks pretty tasty. But who baked it?'),nl.

description('rusty key') :-
  write('  Whoever put a rusty key into a stuff wasn''t very smart.'),nl.

%-------------------------------------------------------------------------------
% COUNTER

description(fish) :-
  write('  Stinky, but fresh fish.'),nl.

description('purring cat') :-
  write('  Cute. *purr purr*'),nl.

description(fork) :-
  write('  A fork. Good for stabbing...well...food.'),nl.


%-------------------------------------------------------------------------------
% DINNERTABLE

description(plate) :-
  write('  Round, pretty plate. Good to eat something off of.'),nl.

description('table leg') :-
  write('  Maybe you can hit someone with it. Or make a fire.'),nl.


%-------------------------------------------------------------------------------
% CHAIRS

description(pillow) :-
  write('  Fluffy. Very fluffy. Looking at it makes you tired.'),nl.


%-------------------------------------------------------------------------------
% VITRINE

description('small statue') :-
  write('  It just needs some blood on it and this might be a murder house.'),nl.


%-------------------------------------------------------------------------------
% PAINTING

description(picture) :-
  write('  Maybe you can use it as a handkerchief.'),nl.

description(letter) :-
  write('  Old letter with a wax-stamp on it. Still closed.'),nl.

description('open letter') :-
  write('  The men are sitting on 8 chairs, looking through 1 window.'), nl,
  write('  While the maid is walking down the 9 stairs, she''s staring'),nl,
  write('  down at the one and only carpet.'),nl.


%-------------------------------------------------------------------------------
% LIVING ROOM TABLE

description(magazine) :-
  write('  Crappy TV-Magazine. The last time you watched TV was 5 years ago.'),nl.


%-------------------------------------------------------------------------------
% WINDOW

description(glass) :-
  write('  Perfect for cutting something. Or garbage. Who knows.'),nl.


%-------------------------------------------------------------------------------
% ARMCHAIR

description(key) :-
  write('  Looks more usefull than any other thing in this house.'),nl.

description(whip) :-
  write('  Indiana Jones is calling you! Awesome!'),nl.


%-------------------------------------------------------------------------------
% LEATHER COUCH

description(leather) :-
  write('  Why would you carry the skin of a cow around?'),nl.

description('slice of pizza') :-
  write('  Yummi, pizza! But yuck, it must be way too old to be eatable...'),nl.

% ------------------------------------------------------------------------------
% LOCKER

description('folded piece of paper') :-
  write('  A folded piece of paper.'),nl.


%###############################################################################
% -----------------     Descriptions for new combined items     ----------------
%###############################################################################


description('cat-sword') :-
  write('  Awesome cat-sword! Miau your opponents to death with each hit!'),nl.

description('burned fish') :-
  write('  Pitch black fish. Good for nothing...or is it?').

description('burning torch') :-
  write('  Usefull in dark places.'),nl.

description('dust-shoe') :-
  write('  The most useless item ever.'),nl.

description('shoe-spear') :-
  write('  Almost as good as a regular spear.'),nl.

description('shoe on a wire') :-
  write('  Maybe a cat likes this wanna-be toy.'),nl.

description('delicious shoe') :-
  write('  Looking at it, you get kind of hungy.'),nl.

description('mega-super-stinky-shoe-fish') :-
  write('  It smells horrific!'),nl.

description('shoe-on-a-pillow') :-
  write('  All mighty! Nothing more.'),nl.

description(fluffhorn) :-
  write('  A fluffy horn. You shouldn''t try to stab someone with it.'),nl.

description(dusthorn) :-
  write('  A very dusty horn. Naybe you can make someone sneeze with it.'),nl.

description('creepy looking shoehorn') :-
  write('  With his one and only eye, it stares at you.'),nl.

description('creepy looking shoehorn') :-
  write('  With his one and only eye, it stares at you.'),nl.

description(fishhorn) :-
  write('  A fishhorn. What do you expect it looks like?'),nl.

description(whiphorn) :-
  write('  It''s like whipping someone, only more painfull!'),nl.

description('unfolded piece of paper') :-
  write('  The only thing written on it is:'),nl,nl,
  write('  BURN MOTHER#!§($%, BURN!'),nl.

description('stuffed chicken') :-
  write('  A fluffy-stuffed chicken. You''re getting hungry').
