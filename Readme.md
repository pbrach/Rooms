About Rooms
===========
The text adventure Rooms throws a nameless hero who has an ordinary live, into a wicked house that forces him to solve puzzles that transcend all reason. Will he be able to escape alive?
In the beginning the hero wakes up in the entrance hall of an old dusty shack with nothing but his old pants on and the memories of the latest events lost...

To finish the game the user has to solve some major puzzles by commanding the nameless hero through the game by using simple english sentences. Beside following the the main target to escape from the house and make it to the 'outside', the user may also try a lot of not game solving interactions.
(The doc directory also contains a walkthrough)



How To Start Rooms
==================
This game is Prolog based, thus you need to install a Prolog interpreter. We recomend swi-prolog (http://www.swi-prolog.org), debian package "swi-prolog".

The game consists of 11 prolog files in a single directory. From that working directory call the game directly from the console of your choice with:

$ swipl -s rooms.pl -g "start."

Alternatively start swipl and consult the file rooms.pl. Type:
-? start.

You should be able to kill the game any time by typing

quit

Or simply push: ctrl + d



Controls
========
After starting the game the first thing the user will see is a short help text that explains how to control the game. Generally it is possible to type normal english sentences (use of upper and lower case, or sentence signs are free to use but not mandatory).

The major requirement for the user input is that the instructions always have to start with a verb. Imperatives have to be used like:

Instruction:                                Example:
> go to [room-name]                         "go to the kitchen""
> look in [something]                       "look in the desk"
> look at [something]                       "look at the door"
> take [something]                          "take the apple"
> use [something]                           "use number pad"
> use [something] with/on [another thing]   "use key on locker"
> combine [something] with [another thing]  "combine open letter with table leg"

Instruction 
(without a subject):    Explanation:
> look around           Gives a description of the surroundings
> show inventory        Lists items you have with you

Other verbs are also understood, like: 
open, hit, kick, burn, eat, fart, talk, pull, unfold, give, put, jump

"Things" are the objects (rooms, items, furniture, etc...) that are described in the game. The whole name of these objects is required. Short cuts like 'key' for 'rusty key' will not work. 

To exit the game type: quit, exit, bye or good bye.



In Game Example
===============
Here is a standard game dialogue:

> Take the shoe!

  You have the shoe.

> Eat the shoe!

  You’re getting hungy and in the shoe you can see the cow that was
  skinned for the leather. You try to eat the shoe, and almost choked
  to death.


