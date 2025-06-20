INCLUDE Globals.ink

-> follow_shad_whisk
=== follow_shad_whisk ===
#music_ShadMusic

#speaker:{Name}
I head to the Galley while Pearl disappears, talking to herself like she just failed a hostage negotiation.

Shad stands over the stove, stirring a pot like it personally offended him.  
He doesn’t even blink when it boils over — it’s like he’s somewhere else.

#speaker:{Name}
"Still mad?"

#speaker:Shad
#pose:Default
#expression:Angry
"No… well yeah maybe. I know it’s childish and I don’t want to feel this way but I just do."

#speaker:{Name}
"Didn’t know a whisk could cause so much emotional damage."

#speaker:Shad
#pose:Default
#expression:Sad
"Wasn’t just a whisk. I’ve had it since my first proper kitchen. Before all this — before the pirate stuff."

#Speaker:{Name}
He pauses, then laughs a little.

#speaker:Shad
#pose:Default
#expression:Neutral
"Yeah maybe it is a dumb reason to be upset. I’m not great at a lot of things, but cooking? That’s my thing. And that whisk was part of that, you know?"

#Speaker:{Name}
For once, he doesn’t have his usual goofy smile. He’s just... kind of honest.

* "Well your food might be a mystery, but your heart? That’s seasoned just right."
    -> shad_follow_flirt
* "I mean sure — but it’s also just a whisk. Not your childhood dog."
    -> shad_follow_disinterest

=== shad_follow_flirt ===
~ Shad_Affection += 10
~ shad_exit_type = "flirty"
#music_Flirty

#Speaker:{Name}
His eyes widen. He breaks into a sheepish grin.

#speaker:Shad
#pose:Pose2
#expression:Smile
"Really? Me? People usually call me a walking hazard or a kitchen apocalypse."

#speaker:{Name}
"Maybe. But you care — and that’s what counts. You’re the type of person who’d burn a cake trying to make someone feel better."

#Speaker:{Name}
 He lets out a hearty chuckle.
 
#speaker:Shad
#pose:Pose2
#expression:Smile
"Guilty as charged. I have. Twice."

#Speaker:{Name}
He pauses. The laughter fades into something softer, more intimate.

#speaker:Shad
#pose:Default
#expression:Blush
"Thanks, Cap’n. I really appreciate being seen like that — as myself.  
Not just a chaotic mess or the guy who’s comedic relief."

#speaker:{Name}
"I guess I’ll just have to keep complimenting you then."

#Speaker:{Name}
Shad grins, voice dropping just a little.

#speaker:Shad
#pose:Pose2
#expression:Blush
"Careful Cap’n. You keep that up and I might start thinking you’re sweet on me."

#Speaker:{Name}
He leans in to whisper.

#speaker:Shad
#pose:Pose2
#expression:Smile
"And if you are... well, I’m not exactly known for resisting temptation."

#Speaker:{Name}
As I'm about to leave, something catches my eye.

#Speaker:{Name}
(I should ask him about it.)

-> END

=== shad_follow_disinterest ===
~ Shad_Affection -= 5
~ shad_exit_type = "disinterested"

#Speaker:{Name}
(Shad blinks. His soft smile falters just a little.)

#speaker:Shad
#pose:Pose2
#expression:Sad
"Right... yeah. Just a whisk. Obviously."


#speaker:{Name}
He stirs the pot again — more out of habit.  
The bubbling sounds a little too loud, but maybe it’s just the silence between us.

#Speaker:{Name}
"You’re an alright cook, Shad. Just save the emotional breakdowns for something that actually matters."

#Speaker:{Name}
He doesn’t respond immediately. Instead, he gives a sharp nod and a tight smile that doesn’t reach his eyes.

#speaker:Shad
#pose:Default
#expression:Angry
"Yup. Got it, Cap’n. Back to business."

#Speaker:{Name}
(Maybe I should change the subject by asking about his items?)

-> END

