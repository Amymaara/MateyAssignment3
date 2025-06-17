INCLUDE Globals.ink

-> pearl_visit 

=== pearl_visit ===
#music_PearlMusic

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
She suddenly turned around, bright-eyed.

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"Oh! I didn’t hear you come in — you surprised me."

#speaker:Pearl
#pose:Default
#expression:Smile
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


* "You’re strange, really strange and honestly I don’t mind it."
    -> compliment_unique
* "I’m reserving judgement for now."
    -> reserve_judgment
* "You’re a walking fever dream, but I've seen weirder. Like a crab cult. Long story."
    -> crab_cult_response

=== compliment_unique ===
~ Pearl_Affection += 10

#speaker:Pearl
#pose:Default
#expression:Smile
"That’s the nicest compliment I’ve ever gotten!"

-> pearl_island

=== reserve_judgment ===
~ Pearl_Affection -= 5

#speaker:Pearl
#pose:Default
#expression:Neutral
"Oh, okay. Can’t say I'm not a little disappointed."

-> pearl_island

=== crab_cult_response ===
~ Pearl_Affection += 5

#speaker:Pearl
#pose:Default
#expression:Neutral
"You've heard of the Clawsome Crab Cult?! I gotta renew my membership sometime…"

-> pearl_island

=== pearl_island ===
#speaker:Pearl
#pose:Pose3
#expression:Neutral
"Oh! You know, recently I've been really into those newspaper questions like, if you were a fruit what would you be. Have you heard of them?"

#Speaker:{Name}
"Yeah, I don't pay much mind to them though."

#Speaker:Pearl
#pose:Pose2
#expression:Neutral
"Well, I'm stumped on today's question, would you mind telling me your answer for it?"

#Speaker:{Name}
"Uhh, sure"

#Speaker:Pearl
#pose:Pose3
#expression:Neutral
"If you had to pick one thing to keep on a deserted island, what would it be?"

#speaker:{Name}
(Where is this going?)


* "Something practical like a knife."
    -> pearl_island_knife
* "A book. Entertainment and kindling."
    -> pearl_island_book
* "A bottle of seawater that screams at night."
    -> pearl_screaming_water
    
=== pearl_island_knife ===
~ Pearl_Affection += 5


#speaker:Pearl
#pose:Pose2
#expression:Smile
"Classic. Very pirate. Very stabby. I respect it."

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"I’d probably bring sea sparkles. Not helpful at all — but morale is important."

-> continue_to_belongings

=== pearl_island_book ===
~ Pearl_Affection += 10

#speaker:Pearl
#pose:Pose3
#expression:Blush
"Ooh, multi-purpose! Smart and slightly chaotic — I like it."

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"I’d bring a romance novel. Something with pirates, obviously."

-> continue_to_belongings

=== pearl_screaming_water ===
~ Pearl_Affection -= 5

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"...Excuse me?"

#speaker:{Name}
"Yeah. I figured it could ward off evil spirits. Or, you know, attract them for conversation."

#speaker:Pearl
#pose:Pose3
#expression:Angry
"You’d trap seawater spirits like that? And let it suffer? That’s... disturbing."

#speaker:Pearl
#pose:Default
#expression:Neutral
"You know the ocean’s and its spirits are alive, right? Stuff like that - it’s wrong. No wonder the waves avoid some people..."

#speaker:{Name}
She turns away, busying herself with rearranging shells.

-> continue_to_belongings

=== continue_to_belongings ===
#speaker:Pearl
#pose:Pose2
#expression:Neutral
"Anyway — as I was saying earlier..."

-> pearl_belongings

=== pearl_belongings ===
#speaker:{Name}
The room settles into a softer kind of quiet. Pearl’s eyes scan her belongings like she’s seeing memories, not just objects.

#speaker:Pearl
#pose:Pose3
#expression:Neutral
"Most people think I collect junk. But to me? These are memories of places I loved... or tried to love."

#speaker:{Name}
"Seems like they’ve been loved back. Everything feels like it's been placed with intention."

#speaker:Pearl
#pose:Pose2
#expression:Smile
"That’s because they matter. Even the cracked ones."

#speaker:{Name}
"I get it. Sometimes it’s the broken things that stick around the longest."

#speaker:Pearl
#pose:Default
#expression:Neutral
"Yeah. Sometimes I wonder if I’ve lived too many lives already. Maybe that’s why things follow me."

#speaker:{Name}
"Things, or people?"

#speaker:{Name}
She laughs but it doesn’t quite reach her eyes.

#speaker:Pearl
#pose:Default
#expression:Neutral
"But enough emotional excavation for today! Let’s talk practical magic."

#speaker:{Name}
"You mean... like shell placement?"

#speaker:Pearl
#pose:Pose3
#expression:Smile
"Exactly! I need to decide where my belongings go. They need to twinkle just right. The moonlight shifts to different angles when you're on sea. They all need to shine their brightest."

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"So, what brought you to my little corner of controlled chaos, Captain {Name}?"

#speaker:{Name}
* "I wanted to see the ship's heart. I think I found it."
    -> pearl_flirt
* "Routine inspection. Making sure there’s no funny business going on — and you’re screaming funny business."
    -> pearl_inspection

=== pearl_flirt ===
~ Pearl_Affection += 10
~ pearl_exit_type = "flirty"
#music_Flirty

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
#expression:Smile
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
~ Pearl_Affection -= 5

#speaker:Pearl
#pose:Default
#expression:Neutral
"Haha, gulp. Define funny business?"

#speaker:Pearl
#pose:Default
#expression:Neutral
"Haha, yeah well — look at the time. I think I need to reorganise my sock drawer. Private business, you know, because you can’t let anyone see… your socks undrawered. I mean unorganised!"

#Speaker:{Name}
Trying to get her to calm down, I reached for one of her items.

#speaker:{Name}
(Let's try talking about this)

-> END