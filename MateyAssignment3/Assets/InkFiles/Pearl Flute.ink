INCLUDE Globals.ink

-> pearl_flute
=== pearl_flute ===

{pearl_exit_type == "flirty":
    -> flute_flirty
- else:
    -> flute_disinterested
}

=== flute_flirty ===

#Speaker:{Name}
I find a delicate glass flute that has gold embellishments and sea beads.

"This is...beautiful."

#Speaker:Pearl

"Thank you, It's my treasure. My mom gave it to me right before I left my home town."

#Speaker:{Name}
"You play?"

#Speaker:Pearl

"I sure do. I'm not a singer - no matter how much I want to be, but this?"

#Speaker{Name}

She gently carreses it, so delicately like she's scared it would shatter.

#Spaker:Pearl
'This is my real voice."

#Speaker:{Name}
"I'd listen to that voice anytime."

She gently bites her lips and turns away shyly. 
She tries to hide it but I catch a smile.

#Speaker:Pearl
"You keep saying things like that and i'll start composing just for you, Captain {Name}."

-> END

=== flute_disinterested ====

#Speaker:{Name}
A glass flute catches my gaze. It gleams gently, showcasing it's beads and trim.

"Is this for decoration?"

#Speaker:Pearl
"No, it's mine. I play it. It helps me stay centered."

#Speaker:{Name}

"Huh?"

She doesn't say anything else, she just picks it up and holds it protectively.

I decide it wasn't worth my time nor effort to further pursue this conversation.
-> END