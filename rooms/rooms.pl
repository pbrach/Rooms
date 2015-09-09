%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  R O O M S  -  Main Program:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To start the program from console 
% type: swipl -s rooms.pl -g "start."

% Include all logic base facts and clauses:
:- include('logic_base.pl').        % logic-/fact base to define the game world
:- include('descriptions_base.pl').   % descriptions for everything you see
:- include('combinations_base.pl').   % various things you can combine
% events:
:- include('event_open_base.pl').
:- include('event_use_base.pl').
:- include('event_hit_kick_base.pl').
:- include('event_eat_base.pl').

% Include 'game engine' functions/predicates:
:- include('io_mod.pl').      % methods to read user input lines
:- include('parse_mod.pl').   % to translate user input to an action
:- include('actions_mod.pl'). % definitions of possible user actions

% main program loop:
% start with help, intro and look and
% then repeat:
% - getting a sentence
% - interpret the sentence as a command
% - execute/do the action
% - display the finish if outside (applause)
% repeat until user quits, game is finished, or player is dead
start :-
%  welcome,
  help,
  intro,
  look,
  repeat,
  nl,
  read_sentence(Sen),
  get_command(X, Sen),
  do(X),
  applause,
  (done; X == quit; dead).

quit:-
  write('quitting the game...'),nl,nl,
  halt.

dead :-
  ( (counter(Y), Y == 0); you(dead)),
  nl,nl,write('  YOU ARE DEAD...how sad.'),nl,nl,
  halt.

% quit the game by finishing:
done :-
  you(outside),
  halt.

% Successful finish:
applause :-
  you(outside),nl,nl,
  write('  You step outside. Slowly. One foot after another.'),nl,
  write('  You need to cover your eyes because the glaring light'),nl,
  write('  almost blinds you. The fresh smell of gras runs up your nose.'), nl,
  write('  "Freedom" you think. Finally. One step after another. Steadily.'),nl,
  write('  Your eyes adapted to the light and you can see normal again.'),nl,
  write('  You turn around, look at the house, see it''s empty nothingness,'),nl,
  write('  the pure evil aura it emits. With a goosebumps you turn back, head'),nl,
  write('  to the road. Maybe waiting for someone to drive by, and pick'),nl,
  write('  you up. Step by step. Suddenly, you feel a tremendous pain in your'),nl,
  write('  chest. You suffered a heart-attack and died on the spot.'),nl,nl,nl,
  write('                           THE END'),nl,nl,nl,
  write('  Thanks for playing!'),nl,nl,
  write('  Your room mates, the zeBra & kanGuru'),nl,nl,nl.

applause.

% The into:
intro :-
  write('You slowly open your eyes. Dust is falling from the ceiling as you'),nl,
  write('are lying on your back, with nothing on yourself but the old jeans you'),nl,
  write('bought six months ago and your favourite shirt.Carefully you lift your'),nl,
  write('head to look around, and you notice that your socks and shoes are missing.'),nl,
  write('Light is shining through the little cracks in the walls, creating a ray'),nl,
  write('as it''s moving through the dense dust of the old house. You''re feeling'),nl,
  write('as if you are in an old western movie. As you''re trying to stand up'),nl,
  write('you notice that...'),nl,nl,
  get0(_).
