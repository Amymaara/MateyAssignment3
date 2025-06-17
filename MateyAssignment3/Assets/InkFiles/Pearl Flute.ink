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

#Speaker:{Name}
"This is...beautiful."

#Speaker:Pearl
"Thank you, It's my treasure. My mom gave it to me right before I left my hometown."

#Speaker:{Name}
"You play?"

#Speaker:Pearl
"I sure do. I'm not a singer - no matter how much I want to be, but this?"

#Speaker:{Name}
She gently caresses it, so delicately like she's scared it would shatter.

#Speaker:Pearl
"This is my real voice."

#Speaker:{Name}
"I'd listen to that voice anytime."
#Speaker:{Name}
She gently bites her lip and turns away shyly. 

#Speaker:{Name}
She tries to hide it but I catch a smile.

#Speaker:Pearl
"You keep saying things like that and I'll start composing just for you, Captain {Name}."

-> END

=== flute_disinterested ===

#Speaker:{Name}
A glass flute catches my gaze. It gleams gently, showcasing its beads and trim.

#Speaker:{Name}
"Is this for decoration?"

#Speaker:Pearl
"No, it's mine. I play it. It helps me stay centered."

#Speaker:{Name}
"Huh?"

#Speaker:{Name}
She doesn't say anything else, she just picks it up and holds it protectively.

#Speaker:{Name}
I decide it wasn't worth my time nor effort to further pursue this conversation.
-> END