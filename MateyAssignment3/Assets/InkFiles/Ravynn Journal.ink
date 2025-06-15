INCLUDE Globals.ink
-> ravynn_journal

=== ravynn_journal ===

{ravynn_exit_type == "flirty":
-> journal_flirty

-else:
-> journal_disinterested
}

=== journal_flirty ===

#Speaker:{Name}
Sitting atop a chest is a leather journal. It has a really tacky label across the front: 'Top Secret Writing Journal - DO NOT OPEN.'

#Speaker:{Name}
Naturally, I open it.

#Speaker:{Name}
Inside are scribbles, rewritten dialogues, weirdly detailed monster anatomy diagrams...and a note - 'If found, return to Ravynn or perish.'

#Speaker:{Name}
"This wouldn’t happen to belong to a certain bestselling author named R. Seaduction, would it?"

#Speaker:Ravynn
"PUT THAT DOWN."

#Speaker:{Name}
"So it is yours."

#Speaker:Ravynn
"It’s ehm...research."

#Speaker:{Name}
"Uh-huh. I bet this ‘Diedrich the Pack's Alpha’ is deeply symbolic."

#Speaker:Ravynn
"He’s a tortured soul...you wouldn’t understand."

#Speaker:{Name}
"I might, if you read it aloud - for tone of course, possibly over dinner."

#Speaker:Ravynn
"...Don’t test me, I have steamy excerpts and zero shame."

-> END

=== journal_disinterested ===

#Speaker:{Name}
A leather journal sits on a chest. Across the front is a label that reads - 'Top Secret Writing Journal'.

#Speaker:{Name}
I raise a brow and glance at her.

#Speaker:{Name}
"Bit weird, even for you."

#Speaker:Ravynn
"It’s personal."

#Speaker:{Name}
I flip the cover anyway - diagrams, scene breakdowns, what looks like fanart in the margins.

#Speaker:{Name}
"You write... this?"

#Speaker:Ravynn
"I write stories. What I do with them is none of your business."

#Speaker:{Name}
I close the book and slide it back. She watches carefully, saying nothing.

-> END