INCLUDE Globals.ink

-> pearl_visit 

=== pearl_visit ===
#music_Celtic-moon-loop-1-284914

#speaker:Stu
"Why don’t we pay a visit to Pearl?"

#speaker:{Name}
I stepped into a room that smelled of lavender, salt and the local fish market on a good day. Trinkets were scattered about — if the sea had a souvenir market, this would be it.

#speaker:{Name}
In the middle of the room, there she stood.

#speaker:Pearl
#pose:Default
#expression:Neutral
"...no Sardinella, clockwise bubble bursts. Don’t sass me."

#speaker:{Name}
(Is she talking to a… fish?)

#speaker:{Name}
She suddenly turned around, bright eyed.

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"Oh! I didn’t hear you come in — you surprised me."

#speaker:Pearl
#pose:Default
#expression:Neutral
"You must be the new Captain, {Name}! We were taking bets on what you’d be like. I guessed tall and grumpy, she said damp and confused."

#speaker:{Name}
"We…?"

#speaker:{Name}
(Wait, she can’t be talking about…)

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"This is Sardinella, she’s quite lazy. I have to give her that little push to get her to maintain her daily 1000 swims. She’s feeling a bit agitated today."

#speaker:Pearl
#pose:Pose3
#expression:Neutral
"So {Name}. I need honest pirate feedback — how do I come across to you? I can take it! …probably."

#speaker:{Name}
(Okay, so we’re just gonna move past the fish? Fine by me.)

#speaker:{Name}
* ["You’re strange, really strange and honestly I don’t mind it."]
    -> compliment_unique
* ["I’m reserving judgement for now."]
    -> reserve_judgment
* ["You’re a walking fever dream, but I've seen weirder. Like a crab cult. Long story."]
    -> crab_cult_response

=== compliment_unique ===
~ Pearl_Affection += 10

#speaker:{Name}
"You’re strange, really strange and honestly I don’t mind it."

#speaker:Pearl
#pose:Default
#expression:Blush
"That’s the nicest compliment I’ve ever gotten!"

-> pearl_belongings

=== reserve_judgment ===
~ Pearl_Affection -= 10

#speaker:{Name}
"I’m reserving judgement for now."

#speaker:Pearl
#pose:Default
#expression:Neutral
"Oh, okay. Can’t say I'm not a little disappointed."

-> pearl_belongings

=== crab_cult_response ===
~ Pearl_Affection += 0

#speaker:{Name}
"You’re a walking fever dream, but I've seen weirder. Like a crab cult. Long story."

#speaker:Pearl
#pose:Default
#expression:Neutral
"You've heard of the Clawsome Crab Cult?! I gotta renew my membership sometime…"

-> pearl_belongings

=== pearl_belongings ===
#speaker:Pearl
#pose:Pose3
#expression:Neutral
"Anyways, I’m still deciding where my belongings should go. I need to place it so that they twinkle just right."

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"What brought you to my little corner of controlled chaos, Captain {Name}?"

#speaker:{Name}
* ["I wanted to see the ship's heart. I think I found it."]
    -> pearl_flirt
* ["Routine inspection. Making sure there’s no funny business going on — and you’re screaming funny business."]
    -> pearl_inspection

=== pearl_flirt ===
~ Pearl_Affection += 10

#speaker:{Name}
"I wanted to see the ship's heart. I think I found it."

#speaker:{Name}
She slow blinks, once, twice, thrice.

#speaker:Pearl
#pose:Default
#expression:Blush
"That’s — uh, um Sardinella did you hear that? I mean, I know you can’t hear human words — but um wow, that’s wow."

#Speaker:{Name}
She looked at me, then the floor, then a jar labelled “Emergency shells”, then back at me.

#speaker:Pearl
#pose:Pose2
#expression:Blush
"Okay cool, yeah, no this is fine — totally normal. I’m super chill right now."

#Speaker:{Name}
She proceeds to drop a seashell, pick it up, and immediately drop it again.

#speaker:Pearl
#pose:Pose3
#expression:Blush
"ANYWAY! My seashells, yes, gotta place them just right, yup. This is a science, totally not me swooning — this is serious. Very serious!"

#Speaker:{Name}
I decided walking toward the door would be better than witnessing whatever this is.

#speaker:{Name}
My hand catches on something, Oh? It's one of her belongings.

#speaker:{Name}
(Let's ask about it)

-> END

=== pearl_inspection ===
~ pearl_exit_type = "disinterested"
~ Pearl_Affection -= 10

#speaker:{Name}
"Routine inspection. Making sure there’s no funny business going on — and you’re screaming funny business."

#speaker:Pearl
#pose:Default
#expression:Neutral
"Haha, gulp. Define funny business?"

#speaker:Pearl
#pose:Default
#expression:Neutral
"Haha, yeah well — look at the time. I think I need to reorganise my sock drawer. Private business, you know, because you can’t let anyone see… your socks un-drawered. I mean unorganised!"

#Speaker:{Name}
Trying to get her to calm down, I reached for one of her items.

#speaker:{Name}
(Let's try talking about this)

-> END