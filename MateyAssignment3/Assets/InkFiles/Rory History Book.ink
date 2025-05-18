INCLUDE Globals.ink

-> rory_history_book
=== rory_history_book ===

{ rory_exit_type == "flirty":
-> history_flirty
- else:
-> history_disinterested
}

=== history_flirty ===

#Speaker:{Name}

The red leather covers practically begs to be opened. I don't know what's heavier, the pages or the implications.

I hear Master Porthole's soft voice behind me

#Speaker:Master Porthole
"That's not just history to me, you know? It's everything I plan to do differently."

#Speaker:{Name}
"So... like strategic bedtime reading?"

#Speaker:Master Porthole
"A roadmap, writtem by tyrants. I plant to correct it, one empire mistake at a time."

#Speaker:{Name}
"Sounds personal."

#Speaker:Master Porthole
"Everything worth fighting for always is."

#Speaker:{Name}

I close the book gently, like it's a sacred tome.

-> END

=== history_disinterested ===

#Speaker:{Name}
"This book practically screams dramatics at me."

He replies flatly.

#Speaker:Master Porthole
"Something about it amuse you, Captain {Name}?"

#Speaker:{Name}
"It's just... a lot of drama for something with footnotes."

#Speaker:Master Porthole
"Why bother touching or talking about it if it bores you."

#Speaker:{Name}
He takes the book from my hands, a little too quickly.

He turns away before I can reply.

-> END