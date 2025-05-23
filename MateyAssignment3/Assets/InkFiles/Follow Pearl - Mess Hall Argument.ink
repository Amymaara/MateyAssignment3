INCLUDE Globals.ink

-> follow_pearl_whisk
#music_Celtic-moon-loop-1-284914
=== follow_pearl_whisk ===

#speaker:{Name}
I find Pearl in her room, sitting on her chair watching Sardinella float calmly as she gently hums.

#speaker:{Name}
"Didn’t know you were a sea creature rights activist."

#speaker:Pearl
#pose:Default
#expression:Angry
"Of course I am. That octopus was just trying to help stir something up, probably!"

#speaker:{Name}
"You okay? Still mad at Shad?"

#speaker:Pearl
#pose:Default
#expression:Neutral
"No, I’m not mad at him. He just doesn’t think the way I do."

#speaker:Pearl
"We need all types of brains on deck — even if his is ginger flavoured."

#Speaker:{Name}
She doesn’t laugh, but rather smiles gently.

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"I’ve always felt things out there understood me better — sea creatures, the waves, even the stars."

#speaker:Pearl
#pose:Pose2
#expression:Sad
"But people? They usually think I’m a joke."

#speaker:{Name}
"You’re not."

#speaker:Pearl
#pose:Pose2
#expression:Sad
"I just saw myself in that octopus. I know he didn’t have bad intentions — he probably saw something shiny and wanted a closer look."

#speaker:Pearl
#pose:Pose3
#expression:Sad
"And besides, I know what it feels like to be misunderstood."

#Speaker:{Name}
She dips her fingers into the bowl and watches the ripples, her face tinted with sorrow.

* [You're strange]
    -> pearl_follow_flirt
* [Misunderstood?]
    -> pearl_follow_disinterest

=== pearl_follow_flirt ===
~ Pearl_Affection += 10
~ pearl_exit_type = "flirty"

#speaker:{Name}
"I trust you. And I happen to think you’re exactly the kind of strange that makes this ship worth sailing."

#speaker:{Name}
Her eyes widen. A real blush blooms across her cheeks.

#speaker:Pearl
#pose:Pose3
#expression:Blush
"If you keep saying things like that, I’ll have to add you to the list of things that make me swoon dramatically."

#speaker:{Name}
"How long is that list?"

#speaker:Pearl
#pose:Pose2
#expression:Blush
"Short. But you’ve won yourself first place. Followed by nautilus shells and poems."

#speaker:{Name}
She nudges a bit closer to me. There’s laughter in her voice again — and a hint of something else.

#speaker:{Name}
(Something sparkles and catches my attention, let's try asking what that is.)
-> END

=== pearl_follow_disinterest ===
~ Pearl_Affection -= 10
~ pearl_exit_type = "disinterested"

#speaker:{Name}
"It’s an octopus. I don’t think it can be 'misunderstood.'"

#speaker:{Name}
She blinks. Her usual spark is nowhere to be found.

#speaker:Pearl
#pose:Pose2
#expression:Angry
"I know I’m weird. I collect shiny things and defend sea animals. Most people don’t find me to be exactly crew material."

#speaker:{Name}
"As long as it doesn’t interfere with the actual sailing of the ship, I don’t really care what you get up to."

#speaker:{Name}
She pauses for just a moment.

#speaker:Pearl
#pose:Pose2
#expression:Sad
"Oh. Right. Well... I guess it’s good to know I’m just efficient cargo."

#speaker:{Name}
"Well, you’re not the worst we got."

#speaker:Pearl
#pose:Pose2
#expression:Angry
"Mmh. I’ll take it, I guess."

#speaker:{Name}
She glances away, adjusting her trinkets like she’s building a barrier between us.  

#speaker:{Name}
The wind sways her hair and — for the first time since I’ve met her — she doesn’t say anything strange or magical. Just... nothing.

#speaker:{Name}
(The silence is unbearable, maybe I should ask about her new trinket?)

-> END