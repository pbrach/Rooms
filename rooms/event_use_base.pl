% ##############################################################################
% ----------------------------       USAGE       -------------------------------
% ##############################################################################

% ---------------  Use items in your inventory with the world  ----------------

% ------------------------------------------------------------------------------
% ENTRANCE DOOR

single_event(open, 'entrance door') :-
  write('  Thinking about getting out of this place, you try to open the door,'),nl,
  write('  but as soon as you touch it, you begin to feel weak and tired and'),nl,
  write('  are unable to move it even an inch.'),nl.

% ------------------------------------------------------------------------------
% STOVE

event(use, torch, stove) :-
  retract(inventory(torch)),
  asserta(inventory('burning torch')),
  write('  Putting the torch in the stove, you might expect some useless'),nl,
  write('  result...but the torch begins to burn!'),nl.

event(use, fish, stove) :-
  retract(inventory(fish)),
  asserta(inventory('burned fish')),
  write('  Thinking about food, you put the fish on the stove, and turn it on.'),
  write('  It begins to smell awfully, as the fish is burned to a crisp.'),nl.

single_event(use, stove) :-
  not(location(fish,stove)),
  write('  Nothing to cook is in there!').

single_event(talk, stove) :-
  write('  I''m sooo hot.'),nl.

single_event(use, stove) :-
  retract(location(fish,stove)),
  asserta(inventory('burned fish')),
  write('  Thinking about food, you put the fish on the stove, and turn it on.'),
  write('  It begins to smell awefull, as the fish is burned to a crisp.'),nl.

% ------------------------------------------------------------------------------
% MIXER

single_event(talk, mixer) :-
  write('  Suuuuuuurrrrrr, ssssssuuuuuuurrrrrrrr.'),nl.

event(use, shoe, mixer) :-
  retract(inventory(shoe)),
  write('  You put the shoe into the mixer and turn it on, completely shredding the shoe.'),nl.

% ------------------------------------------------------------------------------
% NUMBER PAD

single_event(use, 'number pad') :-
  read_number(Number, 4),
  check_pad(Number).

check_pad(Number) :-
  Number = 8191,
  write('  The red light suddenly turns green, and you hear a loud clicking'),nl,
  write('  sound. White fog is comming out of the door as it opens a little,'),nl,
  write('  but enough to just pull it open.'),nl.

check_pad(Number) :-
  Number \= 8191,
  write('  Nothing happens, but a cold shiver runs down your back, as the'),nl,
  write('  display suddenly shows a '),
  count_up,
  write('.'),nl.

% ------------------------------------------------------------------------------
% LOCKER

single_event(open, locker) :-
  write('  It''s locked. Oh wow, a locked locker...'),nl.

event(use, key, locker) :-
  retract(inventory(key)),
  retract(closed_look(locker)),
  retract(closed_take(locker)),
  write('  You take your key out of your pocket, and out of nowhere the key'),nl,
  write('  flies to the locker, hitting it, and exploding. Strange. At least'),nl,
  write('  the locker is open now.'),nl.

% ------------------------------------------------------------------------------
% PIECE OF PAPER
single_event(unfold, 'folded piece of paper') :-
  retract(inventory('folded piece of paper')),
  asserta(inventory('unfolded piece of paper')),
  write('  You unfolded the piece of paper. You''re a genious.'),nl.

% ------------------------------------------------------------------------------
% UNFOLDED PIECE OF PAPER

single_event(burn, 'unfolded piece of paper') :-
  inventory(torch),
  write('  It''s like lighting a candle with a freshly cut down tree. You'),nl,
  write('  need to make the torch burn first.'),nl.

single_event(burn, 'unfolded piece of paper') :-
  inventory('burning torch'),
  retract(inventory('unfolded piece of paper')),
  write('  As you hold the paper over the torch, it doesn''t burn.'),nl,
  write('  How unexpected. Just as the fact that, as you are thinking about it,'),nl,
  write('  the paper suddenly bursts into flames and leaves nothing behind but'),nl,
  write('  smoke that forms the words: ''Jump into the n0thingness'''),nl.

event(use, 'unfolded piece of paper', 'burning torch') :-
  inventory('burning torch'),
  retract(inventory('unfolded piece of paper')),
  write('  As you hold the paper over the torch, it doesn''t burn.'),nl,
  write('  How unexpected. Just as the fact that, as you are thinking about it,'),nl,
  write('  the paper suddenly bursts into flames and leaves nothing behind but'),nl,
  write('  smoke that forms the words: ''Jump into the n0thingness'''),nl.

single_event(burn, 'unfolded piece of paper') :-
  write('  With what?'),nl.

event(use, 'unfolded piece of paper', stove) :-
  write('  You put the unfolded piece of paper into the oven, turn it up and'),nl,
  write('  watch the paper burn. As it turns into ashes, they form the words:'),nl,
  write('  "Jump into the n0thingness"'),nl.


% ------------------------------------------------------------------------------
% BUCKET

single_event(use, bucket) :-
  you(X),
  X = void,
  write('  Sounds like a dumb idea, but nevertheless you jump into the bucket,'),nl,
  write('  the pure darkness. It feels like you blacked out for a moment.'),nl,
  write('  You look around and realize that you''re no more in the '),
  write(X),
  write('.'),nl,
  write('  You''re now in the hall.'),nl,
  retract(you(X)),
  asserta(you(hall)).

single_event(use, bucket) :-
  you(X),
  X \= void,
  not(inventory(bucket)),
  write('  Sounds like a dumb idea, but nevertheless you jump into the bucket,'),nl,
  write('  the pure darkness. It feels like you blacked out for a moment.'),nl,
  write('  You look around and realize that you''re no more in the '),
  write(X),
  write('.'),nl,
  write('  You''re floating around in what seems like eternal white space.'),nl,
  write('  Too bad you didn''t bring the bucket with you. It was the only'),nl,
  write('  thing connecting the normal world with the void. You''re destined'),nl,
  write('  to live your last days in pure nothingness.'),nl,
  retract(you(X)),
  asserta(you(dead)).

single_event(use, bucket) :-
  you(X),
  X \= void,
  write('  Sounds like a dumb idea, but nevertheless you jump into the bucket,'),nl,
  write('  the pure darkness. It feels like you blacked out for a moment.'),nl,
  write('  You look around and realize that you''re no more in the '),
  write(X),
  write('.'),nl,
  write('  You''re floating around in what seems like eternal white space.'),nl,
  retract(you(X)),
  asserta(you(void)).

% ------------------------------------------------------------------------------
% LADY

single_event(talk, lady) :-
  write('  Lady: "Hi there, I''m Elondria, keeper of the void. All mighty'),nl,
  write('  and all bored! But good thing you came here, i need you bring me'),nl,
  write('  something awesome to ease my pain of boring nothingness around here.'),nl,
  write('  If you do that I will tell you a secret. A secret, so shocking,'),nl,
  write('  it will blow your mind! Or maybe not. We will see. Now go and bring'),nl,
  write('  me something. Hurry! Time is of an essence."'),nl.

event(use, lady, Item) :-
  ( inventory('cat-sword');
    inventory('indiana-jones-hat');
    inventory('slice of pizza')),
  retract(you(_)),
  asserta(you(hall)),
  retract(inventory(bucket)),
  write('  Lady: "OMFG! Just what i was looking for! Now I can pretend to be'),nl,
  write('  a Jedi!'),nl,
  write('  *the lady makes lightsaber noises as she swings the '),
  write(Item),
  write(' around*'),nl,
  write('  (Cleary she''s tripping some major balls...)'),nl,nl,
  write('  Ah, right, the secret." The lady gets closer to your ear and'),nl,
  write('  whispers: "You shall not talk to furniture which let''s you..."'),nl,nl,
  write('  An almost blinding light begins to shine, and your head almost'),nl,
  write('  bursts. You close your eyes and hold your hands to your head, when'),nl,
  write('  suddenly the light and pain is gone. Opening your eyes and see that'),nl,
  write('  you''re no longer in the void, but hall. Even the bucket in your'),nl,
  write('  pocket is gone. You wonder how it even fit there in the first place.'),nl.

event(use, lady, X) :-
  write('  Nah man, that''s a boring '), write(X), write(', get me something'),nl,
  write('  more exiting. Something...I haven''t seen in like...ever!'),nl.

% ------------------------------------------------------------------------------
% ENTRANCE DOOR

single_event(open, 'entrance door') :-
  write('  Thinking about getting out of this place, you try to open the door,'),nl,
  write('  but as soon as you touch it, you begin to feel weak and tired and'),nl,
  write('  are unable to move it even an inch.'),nl.

single_event(talk, 'entrance door') :-
  write('  Entrance door: " Why are you talking to me a door? A DOOR!'),nl,
  write('  What do you want?'),nl,
  write('  Do you want out of this weird place? If so, fart at me, and I'),nl,
  write('  shall open!"'),nl.

single_event(fart, 'entrance door') :-
  retract(closed(outside, hall)),
  write('  You turn around and fart at the door.'),nl,
  write('  Entrance door: "Eew you really did it! How nasty. God, this stinks'),nl,
  write('  I''m outta here!'),nl.

% ------------------------------------------------------------------------------
% CLOSET DOOR

event(use, 'purring cat', 'closet door') :-
  retract(location('closet door', hall)),
  inventory('purring cat'),
  open_room(closet),
  write('  You rub the cat at the door ''till it gets angry and starts'),nl,
  write('  shredding the door apart. Good thinking!'),nl.

event(use, spoon, 'closet door') :-
retract(location('closet door', hall)),
  inventory(spoon),
  open_room(closet),
  write('  You start carving the door with the spoon. Just like the prisoners'),nl,
  write('  did in the early 1800''s. After you almost fall asleep you realize'),nl,
  write('  that you carved the door away. How lucky!'),nl.

event(use, whip, 'closet door') :-
retract(location('closet door', hall)),
  inventory(whip),
  open_room(closet),
  write('  India Jones style! You whip at the door, and it opens. Just like'),nl,
  write('  in real life.'),nl.

single_event(talk, 'closet door') :-
  write('  Why are you talking to me? I''m the wrong one.'),nl.


% ------------------------------------------------------------------------------
% WINDOW

single_event(open, window) :-
  write('  Can''t you read? It''s boarded up!'),nl.


% ------------------------------------------------------------------------------
% PURRING cat

single_event(talk, 'purring cat') :-
  write('  *purr purr* Miaaaauuuu! Jump into the n0thingness! *purr purr*'),nl.

single_event(stroke, 'purring cat') :-
  write('  *purr purr* Miaaaauuuu! Jump into the n0thingness! *purr purr*'),nl.

single_event(pet, 'purring cat') :-
  write('  *purr purr* Miaaaauuuu! Jump into the n0thingness! *purr purr*'),nl.
