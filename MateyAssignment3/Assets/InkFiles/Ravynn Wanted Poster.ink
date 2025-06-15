INCLUDE Globals.ink
-> ravynn_poster

=== ravynn_poster ===

{ravynn_exit_type == "flirty":
-> poster_flirty

-else:
-> poster_disinterested
}

=== poster_flirty ===

#Speaker:{Name}
There's a half-shredded wanted poster stabbed into the wall with seven different daggers. One of them I recognise, her signature blade - plot twist.

#Speaker:{Name}
"Someone had an unfaithful lover?"

#Speaker:Ravynn
"More or less, that was from a...less civilised time."

#Speaker:{Name}
"You kept it?"

#Speaker:Ravynn
"Every scar deserves a story, that one's mine."

#Speaker:{Name}
"And the daggers?"

#Speaker:Ravynn
"One for every stab it took until their last breath."

#Speaker:{Name}
"Remind me never to get on your bad side."

#Speaker:Ravynn
"I thought you liked my bad side."

-> END

=== poster_disinterested ===

#Speaker:{Name}
There’s a shredded, faded poster pinned to the wall by way too many daggers.

#Speaker:{Name}
"That yours?"

#Speaker:Ravynn
"Yes."

#Speaker:{Name}
"Can’t even see the face anymore."

#Speaker:Ravynn
"Exactly."

#Speaker:{Name}
"Bit dramatic, don't you think?"

#Speaker:Ravynn
"Don’t dig into things that don't concern you, Captain {Name}."

#Speaker:{Name}
Noted.

-> END