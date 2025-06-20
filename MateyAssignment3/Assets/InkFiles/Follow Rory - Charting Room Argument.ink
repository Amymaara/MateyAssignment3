INCLUDE Globals.ink

-> follow_rory
==== follow_rory ====
#music_RoryMusic

#Speaker:{Name}
I step into the study and wonder if I somehow ended up at the palace library.

#Speaker:{Name}
There's a decanter of something expensive on the desk and a chair turned just slightly too far towards the window for it not to be dramatic on purpose.

#Speaker:{Name}
Master Porthole doesn't look up at me.

#Speaker:Master Porthole
#pose:Default
#expression:Neutral
"So... you followed. Should I be flattered or suspicious?"

#Speaker:{Name}
I let out a little chuckle.

#Speaker:{Name}
"Maybe both."

#Speaker:{Name}
He finally turns and looks towards me. His gaze is both sharp and amused. 

#Speaker:{Name}
There's a hint of softness in his eyes, albeit buried deep under about 21 layers of egoism.

#Speaker:Master Porthole
#pose:Pose2
#expression:Sad
"All they think I am is some fool playing dress up, pretending to be someone I'm not."

#Speaker:{Name}
He gets up and walks to the edge of the desk, his fingers trailing the edges of the precious wood.

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"But I was raised for control, for command. I left it behind to chase freedom and my own path - not to watch it fall apart to some wind charts."

#Speaker:{Name}
He turns to face me now, something lies between us — something unspoken in the air.

*"The one who wants control, but craves emotional connections."
-> exit_flirty
*"You remind me of someone I shouldn't trust."
-> exit_disinterested

=== exit_flirty ===
~ rory_exit_type = "flirty"
~ Rory_Affection +=10
#music_Flirty

#Speaker:{Name}
Master Porthole steps closer towards me.

#Speaker:Master Porthole
#pose:Pose3
#expression:Smile
"Careful, Captain {Name}. If you see through me so clearly, I might start thinking we're more than comrades."

#Speaker:{Name}
 I maintain the distance but gaze straight into his amber eyes.
 
 #Speaker:{Name}
 "And if we are?"
 
 #Speaker:{Name}
 He leans in, his voice a low murmur, only meant for me.
 
#Speaker:Master Porthole
#pose:Pose3
#expression:Blush
"And if we are..well. I never did well sharing."

#Speaker:{Name}
"Good, I don't need someone who disappears when things get rough."

#Speaker:Master Porthole
#pose:Pose2
#expression:Smile
"Give me a reason, and I'll follow you into every storm. Cross me and I'll become one."

#Speaker:{Name}
"I don't get shaken easily. But you? You tempt me in the worst possible ways."
 
 #Speaker:{Name}
 There's a heavy silence between us, but it isn't uncomfortable.
 
 #Speaker:{Name}
 "That's enough for now, we could always continue this later."
 
 #Speaker:{Name}
 He smirks and flips through a book he's holding.
 
 #Speaker:{Name}
 As I'm about to leave my eyes catch onto some of his belongings.
 
 #Speaker:{Name}
 (I'm curious what he'd say about these.)
 
 -> END
 
 === exit_disinterested ===
~ rory_exit_type = "disinterested"
~ Rory_Affection -= 5

#Speaker:{Name}
I watch as his jaw tenses, only for a moment, but it's enough to notice.

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"Then I suppose I'll have to polish my mask a little more, won't I?"

#Speaker:{Name}
"Or hear me out, what about taking it off?"

#Speaker:{Name}
He doesn't answer me. Just turns away, he acts as if I'd never walked in.

#Speaker:{Name}
Not wanting to keep this awkward atmosphere between us, my eyes dart around and land on his belongings.

#Speaker:{Name}
(Maybe I can try asking him about them?)

-> END
