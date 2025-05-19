INCLUDE Globals.ink

-> follow_rory
==== follow_rory ====
#music_Celtic-moon-loop-1-284914
#Speaker:{Name}
I step into the study and wonder if I somewhere ended up at the palace library.

There's a decanter of something expensive on the desk and a chair turned just slightly too far towards the window for it not to be dramatic on purpose.

Master Porthole doesn't look up at me.

#Speaker:Master Porthole
#pose:Default
#expression:Neutral
"So.. you followed. Should I be flattered or suspicious?"

#Speaker:{Name}

I let out a little chuckle.

"Maybe both."

He finally turns and looks towards me. His gaze is both sharp and amused. 

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
He turns to face me now, something lies between us - something unspoken in the air.

*[Craving connections]
-> exit_flirty
*[Appearances]
-> exit_disintered

=== exit_flirty ===
~ rory_exit_type = "flirty"
~ Rory_Affection +=10

#Speaker:{Name}
"The one who wants control, but craves emotional connections."

Master Porthole steps closer towards me

#Speaker: Master Porthole
#pose:Pose3
#expression:Blush
"Careful, Captain {Name}. If you see through me so clearly, I might start thinking we're more than comrades."

#Speaker:{Name}
 I maintain the distance but gaze straight into his amber eyes.
 
 "And if we are?"
 
 He leans in, his voice a low murmur, only meant for me.
 
 #Speaker:Master Porthole
 #pose:Pose3
#expression:Blush

"And if we are..well. I never did well sharing."

#Speaker:{Name}

"Good, I don't need someone who disappears when things get rough."

#Speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"Give me a reason, and i'll follow you into every storm. Cross me and i'll become one."

#Speaker{Name}
"I don't get shaken easily. But you? You tempt me in the worst possible ways."
 
 There's a heavy silence between us, but it isn't uncomfortable.
 
 "That's enough for now, we could always continue this later."
 
 He smirks and flips through a book he's holding.
 
 As i'm about to leave my eyes catch onto some of his belongings.
 
 (I'm curious what he'd say about these.)
 
 -> END
 
 === exit_disintered ===
~ rory_exit_type = "disinterested"
~ Rory_Affection -= 10

#Speaker:{Name}
"You remind me of someone I shouldn't trust."

I watch as his jaw tenses, only for a moment, but it's enough to notice.

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"Then I suppose I'll have to polish my mask a little more, won't I?"

#Speaker:{Name}

"Or hear me out, what about taking it off?"

He doesn't answer me. Just turns away, he acts as if I'd never walked in.

Not wanting to keep this awkward atmosphere between us, my eyes dart around and land on his belongins.

(Maybe I can try asking him about them?)

-> END
