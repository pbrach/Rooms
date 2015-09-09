%###############################################################################
% -----------------     Things you try to eat     ------------------------------
%###############################################################################

single_event(eat, shoe) :-
  write('  You''re getting hungy and in the shoe you can see the cow that was'),nl,
  write('  skinned for the leather. You try to eat the shoe, and almost choked'),nl,
  write('  to death.'),nl.

single_event(eat, fish) :-
  retract(inventory(fish)),
  asserta(ate(stronger)),
  write('  You ate the fish and suddenly you feel like Popeye, just without'),nl,
  write('  the monstrous underarms.'),nl.
