% ------------------------------------------------------------------------------
% counter is for the number pad counter
:- dynamic counter/1.

counter(5).

count_up :-
  counter(X),
  retract(counter(X)),
  Y is X-1,
  assert(counter(Y)),
  write(Y).

% ##############################################################################
% ------------------------    COMBINATIONS     ---------------------------------
% ##############################################################################
%
% --------------  Things you can combine with one another  ---------------------

% The new items created by combining items.

% ------------------------------------------------------------------------------
% SHOE

combines_to(shoe, shoehorn) :-
  write('  You try putting the shoehorn in the shoe, but it doesn''t really fit.'),nl.

combines_to(shoe, fluff) :-
  retract(inventory(fluff)),
  retract(inventory(shoe)),
  asserta(inventory('fluffy shoe')),
  asserta(location(fluff, 'fluffy shoe')),
  write('  You put the fluff into the shoe and now you have a very fluffy shoe.'),nl.

combines_to(shoe, dust) :-
  retract(inventory(shoe)),
  retract(inventory(dust)),
  asserta(inventory('dust-shoe')),
  write('  Thinking of old, dusty shoes, you try putting the dust into the shoe'),nl,
  write('  and now you have a dust-shoe! Probably the most useless item ever.'),nl.

combines_to(shoe, broom) :-
  write('  Getting the idea of a shoe-spear, you stick the shoe to the pointy'),nl,
  write('  end of the broom, and you made a shoe-spear.'),nl.

combines_to(shoe, sword) :-
  write('  You pierce with your sword a hole in the shoe. Now you will never'),nl,
  write('  be able to use your shoe as a cup anymore...'),nl.

combines_to(shoe, wire) :-
  retract(inventory(shoe)),
  retract(inventory(wire)),
  asserta(inventory('shoe on a wire')),
  write('  Ýou tie the wire to the shoe and now you have a shoe on a wire!'),nl.

combines_to(shoe, 'done chicken') :-
  retract(inventory(shoe)),
  retract(inventory('done chicken')),
  asserta(inventory('delicious shoe')),
  write('  Some strange lights come out of the chickens butt, and it disappears.'),nl,
  write('  You notice that the shoe looks kind of delicious!'),nl.

combines_to(shoe, 'rusty key') :-
  write('  Rubbing the rusty key on the shoe doesn''t change the fact that you'),nl,
  write('  have a rusty key and an old, stinky shoe.'),nl.

combines_to(shoe, fish) :-
  retract(inventory(shoe)),
  retract(inventory(fish)),
  asserta(inventory('mega-super-stinky-shoe-fish')),
  write('  Combining 2 very stinky things? Really? Ok, you now have a'),nl,
  write('  mega-super-stinky-shoe-fish! You wanted it!'),nl.

combines_to(shoe, 'purring cat') :-
  write('  The cat smells the shoe and slips into a short coma.'),nl.

combines_to(shoe, fork) :-
  write('  You poke the shoe with the fork. Don''t you have better things to do?'),nl,
  write('  Like doing some homework?'),nl.

combines_to(shoe, plate) :-
  write('  Whiping the plate with the the she isn''t a good idea. Why not try a cloth?'),nl.

combines_to(shoe, 'table leg') :-
  write('  Sticking the shoe on the table leg doesn''t work. Too bad your shoe has'),nl,
  write('  no hole in it.'),nl.

combines_to(shoe, pillow) :-
  write('  The all mighty shoe-on-a-pillow!'),nl.

combines_to(shoe, 'small statue') :-
  write('  Too bad the statue''s foor is too small for the shoe'),nl.

combines_to(shoe, picture) :-
  write('  What do you want to do? Paint the shoe? Wrap it in paper? Nah.'),nl.

combines_to(shoe, letter) :-
  write('  Wanna send the shoe in a letter? To whom? You''re all alone in here.'),nl.

combines_to(shoe, magazine) :-
  write('  You hit the magazine with the shoe, because noone wants to know about'),nl,
  write('  a celebreties life.'),nl.

combines_to(shoe, glass) :-
  write('  Cut the shoe? Put glass in the shoe? Nothing usefull can be done.'),nl.

combines_to(shoe, key) :-
  write('  Rubbing the key on the shoe doesn''t change the fact that you'),nl,
  write('  have a key and an old, stinky shoe.'),nl.

combines_to(shoe, whip) :-
  write('  You try exchanging the shoe laces with a whip, but you fail.'),nl.

combines_to(shoe, leather) :-
  write('  The shoe is already made out of leather, you don''t need any more on it.'),nl.

combines_to(shoe, 'slice of pizza') :-
  write('  Do you want a stinky slice of pizza? I don''t think so.'),nl.

combines_to(shoe, 'cat-sword') :-
  write('  The cat already has a sword up his arse, it doesn''t need a shoe in there too.'),nl.

combines_to(shoe, 'burned fish') :-
  write('  Do you want to be stinked to death?'),nl.

% ------------------------------------------------------------------------------
% SHOEHORN

combines_to(shoehorn, jacket) :-
  write('  Come on, what do you want to accomplish?'),nl.

combines_to(shoehorn, coathook) :-
  write('  Stick the coathook into the shoehorn? Or vice versa? Either way, you''re'),nl,
  write('  stupid even trying that.'),nl.

combines_to(shoehorn, fluff) :-
  retract(inventory(shoehorn)),
  retract(inventory(fluff)),
  asserta(inventory(fluffhorn)),
  write('  You hold them together and they melt into a fluffhorn.'),nl.

combines_to(shoehorn, dust) :-
  retract(inventory(shoehorn)),
  retract(inventory(dust)),
  asserta(inventory(dusthorn)),
  write('  You hold them together and they melt into a dusthorn.'),nl.

combines_to(shoehorn, 'plastic eyeball') :-
  retract(inventory(shoehorn)),
  retract(inventory('plastic eyeball')),
  asserta(inventory('creepy looking shoehorn')),
  write('  They fuse together and the shoehorn begins to look at you strangely.'),nl,
  write('  Maybe it''s your new best buddy!'),nl.

combines_to(shoehorn, broom) :-
  write('  You put the shoehorn on top of the broom, but nothing happens.'),nl.

combines_to(shoehorn, bucket) :-
  retract(inventory(shoehorn)),
  write('  Just as you are putting it in there, the eyeball disappears.'),nl.

combines_to(shoehorn, spoon) :-
  write('  Come on, they are practically the same.'),nl.

combines_to(shoehorn, sword) :-
  write('  A shoehorn-sword? What are you thinking...'),nl.

combines_to(shoehorn, wire) :-
  write('  You''re trying to fiddle the wire through the hole in the shoehorn.'),nl,
  write('  ''till you realize that there is no hole.'),nl.

combines_to(shoehorn, 'done chicken') :-
  write('  The chicken moves to the horn, and stops half way through.'),nl.

combines_to(shoehorn, 'rusty key') :-
  write('  You try to open the chicken with the key. But you don''t succeed, as'),nl,
  write('  the chicken is no freaking door you strango.'),nl.

combines_to(shoehorn, fish) :-
  retract(inventory(shoehorn)),
  retract(inventory(fish)),
  asserta(inventory(fishhorn)),
  write('  You slap them both together and hold a fishhorn in your hands.'),nl.

combines_to(shoehorn, 'purring cat') :-
  write('  The cat like the shoehorn once, then purrs'),nl.

combines_to(shoehorn, fork) :-
  write('  Forkhorn? Pretty useles, don''t you think?'),nl.

combines_to(shoehorn, plate) :-
  write('  You put the horn onto the plate, but nothing happens'),nl.

combines_to(shoehorn, 'table leg') :-
  write('  Shoehorn, table leg, shoehorn, table leg ... shoeleg? Nah...'),nl.

combines_to(shoehorn, pillow) :-
  write('  Shoehorn on the pillow? In the pillow? Not really.'),nl.

combines_to(shoehorn, 'small statue') :-
  write('  Too bad the statue is too small for shoes.'),nl.

combines_to(shoehorn, picture) :-
  write('  Sounds like a dumb idea.'),nl.

combines_to(shoehorn, letter) :-
  write('  A letterhorn! ... But what do you need that for?'),nl.

combines_to(shoehorn, magazine) :-
  write('  You gently smack the shoehorn onto the magazine. Well done.'),nl.

combines_to(shoehorn, glass) :-
  write('  You try carving something into the horn, but fail.'),nl.

combines_to(shoehorn, key) :-
  write('  Wanna open shoes with it? Just untie them, dumbo...'),nl.

combines_to(shoehorn, whip) :-
  retract(inventory(shoehorn)),
  retract(inventory(whip)),
  asserta(inventory(swhiphorn)),
  write('  A whiphorn! Good thinking. McGuyver would be proud of you.'),nl.

combines_to(shoehorn, leather) :-
  write('  Nothing usefull you can make out of it.'),nl.

combines_to(shoehorn, 'slice of pizza') :-
  write('  A slice of shoehorn? Hm, sounds delicious...not.'),nl.

% ------------------------------------------------------------------------------
% JACKET

% ------------------------------------------------------------------------------
% COATHOOK

% ------------------------------------------------------------------------------
% FLUFF

combines_to(fluff, 'table leg') :-
  retract(inventory(fluff)),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You put the fluff onto the table leg. Congrats you created a torch!'),nl.

combines_to(fluff, 'done chicken') :-
  retract(inventory(fluff)),
  retract(inventory('done chicken')),
  asserta(inventory('fluffy-stuffed chicken')),
  write('  You stuff the chicken with fluff.').


% ------------------------------------------------------------------------------
% DUST

% ------------------------------------------------------------------------------
% PLASTIC EYEBALL

% ------------------------------------------------------------------------------
% BROOM

combines_to(fluff, broom) :-
  retract(inventory(fluff)),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You wrap the fluff around the broom. Congrats you created a torch!'),nl.

combines_to(picture, broom) :-
  retract(inventory(picture)),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You wrap the picture around the broom. Congrats you created a torch!'),nl.

combines_to(letter, broom) :-
  retract(inventory(letter)),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You wrap the letter around the broom. Congrats you created a torch!'),nl.

combines_to('open letter', broom) :-
  retract(inventory('open letter')),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You wrap the open letter around the broom. Congrats you created a torch!'),nl.

combines_to('purring cat', broom) :-
  retract(inventory('purring cat')),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You put the broom into the poor cats behind, and now you have'),nl,
  write('  a furry, fuzzy, torch. You sadistic man.'),nl.

combines_to(magazine, broom) :-
  retract(inventory(magazine)),
  retract(inventory(broom)),
  asserta(inventory(torch)),
  write('  You wrap the magazine around the broom. Congrats you created a torch!'),nl.


% ------------------------------------------------------------------------------
% BUCKET

% ------------------------------------------------------------------------------
% SPOON

% ------------------------------------------------------------------------------
% MIXER

% ------------------------------------------------------------------------------
% SWORD

combines_to(sword, 'purring cat') :-
  retract(inventory('purring cat')),
  retract(inventory(sword)),
  asserta(inventory('cat-sword')),
  write('  You put the sword in the cats behind and got an awesome cat-sword!'),nl,
  write('  Miau you opponents to death with each hit!'), nl.

% ------------------------------------------------------------------------------
% WIRE

% ------------------------------------------------------------------------------
% DONE CHICKEN

% ------------------------------------------------------------------------------
% RUSTY KEY

% ------------------------------------------------------------------------------
% FISH

% ------------------------------------------------------------------------------
% PURRING CAT

combines_to('purring cat', 'table leg') :-
  retract(inventory('purring cat')),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You put the table leg into the poor cats behind, and now you have'),nl,
  write('  a furry, fuzzy, torch. You sadistic man.'),nl.

% ------------------------------------------------------------------------------
% FORK

% ------------------------------------------------------------------------------
% PLATE

% ------------------------------------------------------------------------------
% TABLE LEG

combines_to('open letter', 'table leg') :-
  retract(inventory('open letter')),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You wrap the open letter around the table leg, and now you have'),nl,
  write('  simple torch. It''s like burning books...'),nl.

% ------------------------------------------------------------------------------
% SMALL STATUE

% ------------------------------------------------------------------------------
% PICTURE

combines_to(painting, 'table leg') :-
  retract(inventory(picture)),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You wrap the picture around the table leg, and now you have'),nl,
  write('  simple torch. Why do you have to destroy everything beautiful?'),nl.

% ------------------------------------------------------------------------------
% LETTER

combines_to(letter, 'table leg') :-
  retract(inventory(letter)),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You wrap the latter around the table leg, and now you have'),nl,
  write('  simple torch.'),nl.

% ------------------------------------------------------------------------------
% MAGAZINE

combines_to(magazine, 'table leg') :-
  retract(inventory(magazine)),
  retract(inventory('table leg')),
  asserta(inventory(torch)),
  write('  You wrap the magazine around the table leg, and now you have'),nl,
  write('  simple torch. At least that crappy magazine served a purpose.'),nl.

% ------------------------------------------------------------------------------
% GLASS

% ------------------------------------------------------------------------------
% KEY

% ------------------------------------------------------------------------------
% WHIP
combines_to(whip, leather) :-
  retract(inventory(whip)),
  retract(inventory(leather)),
  asserta(inventory('indiana-jones-hat')),
  write('  You whip the leather and as unexpected as your whip, the leather'),nl,
  write('  absorbs your whip and forms into an awesome indiana-jones-hat!'),nl.

% ------------------------------------------------------------------------------
% LEATHER

% ------------------------------------------------------------------------------
% SLICE OF PIZZA

% ------------------------------------------------------------------------------
% UNFOLDED PIECE OF PAPER
combines_to('burning torch', 'unfolded piece of paper') :-
  retract(inventory('unfolded piece of paper')),
  write('  As you hold the paper over the torch, it doesn''t burn.'),nl,
  write('  How unexpected. Just as the fact that, as you are thinking about it,'),nl,
  write('  the paper suddenly bursts into flames and leaves nothing behind but'),nl,
  write('  smoke that forms the words: ''Jump into the n0thingness'''),nl.

