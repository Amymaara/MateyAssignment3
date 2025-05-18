INCLUDE Globals.ink

-> pearl_visit 

=== pearl_visit ===
#speaker:Stu
"Why don’t we pay a visit to Pearl?"

#speaker:{Name}
I stepped into a room that smelled of lavender, salt and the local fish market on a good day. Trinkets were scattered about — if the sea had a souvenir market, this would be it.

In the middle of the room, there she stood.

#speaker:Pearl
"...no Sardinella, clockwise bubble bursts. Don’t sass me."

#speaker:Stu
"Is she talking to a… fish?"

#speaker:{Name}
"I think so…"

(She suddenly turned around, bright eyed)

#speaker:Pearl
"Oh! I didn’t hear you come in — you surprised me."

#speaker:Pearl
"You must be the new {Name}! We were taking bets on what you’d be like. I guessed tall and grumpy, she said damp and confused."

#speaker:Stu
"Honestly, fair guesses."

#speaker:{Name}
"We…?"

(Wait, she can’t be talking about…)

#speaker:Pearl
"This is Sardinella, she’s quite lazy. I have to give her that little push to get her to maintain her daily 1000 swims. She’s feeling a bit agitated today."

#speaker:Pearl
"So {Name}. I need honest pirate feedback — how do I come across to you? I can take it! …probably."

(Okay, so we’re just gonna move past the fish? Fine by me.)

* ["You’re… definitely *something*"]
    -> compliment_unique
* ["I’ll decide later"]
    -> reserve_judgment
* ["You remind me of... a cult"]
    -> crab_cult_response

=== compliment_unique ===
~ Pearl_Affection += 10

#speaker:{Name}
"You’re strange, really strange and honestly I don’t mind it."

#speaker:Pearl
"That’s the nicest compliment I’ve ever gotten!"

-> pearl_belongings

=== reserve_judgment ===
~ Pearl_Affection -= 10

#speaker:{Name}
"I’m reserving judgement for now."

#speaker:Pearl
"Oh, okay. Can’t say I'm not a little disappointed."

-> pearl_belongings

=== crab_cult_response ===
~ Pearl_Affection += 0

#speaker:{Name}
"You’re a walking fever dream, but I've seen weirder. Like a crab cult. Long story."

#speaker:Pearl
"You've heard of the Clawsome Crab Cult?! I gotta renew my membership sometime…"

-> pearl_belongings

=== pearl_belongings ===
#speaker:Pearl
"Anyways, I’m still deciding where my belongings should go. I need to place it so that they twinkle just right."

#speaker:Pearl
"What brought you to my little corner of controlled chaos, Captain {Name}?"

* ["Had to see it for myself"]
    -> pearl_flirt
* ["All seems... *suspiciously* normal"]
    -> pearl_inspection

=== pearl_flirt ===
~ Pearl_Affection += 10

#speaker:{Name}
"I wanted to see the ship's heart. I think I found it."

She slow blinks, once, twice, thrice.

#speaker:Pearl
"That’s — uh, um Sardinella did you hear that? I mean, I know you can’t hear human words — but um wow, that’s wow."

She looked at me, then the floor, then a jar labelled “Emergency shells”, then back at me.

#speaker:Pearl
"Okay cool, yeah, no this is fine — totally normal. I’m super chill right now."

She proceeds to drop a seashell, pick it up, and immediately drop it again.

#speaker:Pearl
"ANYWAY! My seashells, yes, gotta place them just right, yup. This is a science, totally not me swooning — this is serious. Very serious!"

I decided walking toward the door would be better than witnessing whatever this is.

#speaker:Stu
"Squaaak — what in the seven seas just happened?"

#speaker:{Name}
"I think I broke her… by flirting."

#speaker:Stu
"Remind me to keep you away from the emotional ones, you heartthrob."

#speaker:{Name}
"Too late. I think she tried to flirt back with that seashell."

We stare at the door for a second, then decide to keep walking away. Fast.

-> END

=== pearl_inspection ===
~ Pearl_Affection -= 10

#speaker:{Name}

"Routine inspection. Making sure there’s no funny business going on — and you’re screaming funny business."

#speaker:Pearl
"Haha, gulp. Define funny business?"

#speaker:Pearl
"Haha, yeah well — look at the time. I think I need to reorganise my sock drawer. Private business, you know, because you can’t let anyone see… your socks undrawered. I mean unorganised!"

Stu leans in to whisper into my ear.

#speaker:Stu
"She seems a bit frazzled, {Name}. Let’s give her some space to, uh… organise her socks?"

#speaker:{Name}
"Yeah, agreed. Let’s get out of here."

I left Pearl's room. She hummed and tossed things about.  
(I wonder why she got so worked up over what I said?)

-> END