INCLUDE Globals.ink

-> follow_rory

=== follow_rory ===

#Speaker:{Name}
I find him exactly where I expected - in the study, pacing like he's trying to outrun his thoughts.

#Speaker:{Name}
The Galley door slammed not too long ago, the echo still ringing in my ear. The images of him and Shad still player on my mind - ego's bruised and voices raised.

#Speaker:{Name}
I decide to lean against the doorway.

#Speaker:{Name}
"Still fuming about the fermented banana?"

#Speaker:Master Porthole
#pose:
#expression:
"I asked for edibility, not gastro roulette."

#Speaker:Master Porthole
#pose:
#expression:
"He was going to serve something so violently flavoured, I would classify it as a maritime weapon."

#Speaker:{Name}
"You stormed out like you were personally betrayed by horseradish."

#Speaker:Master Porthole
#pose:
#expression:
"Because it wasn't about those petty semantic!"

#Speaker:{Name}
He exhale sharply, losing his facade of arrogance just for a second.

#Speaker:Master Porthole
#pose:
#expression:
"I could have been in silk sheets, sipping  champage. Instead I'm here - on a barely floating ship - with pirates and poultry."

#Speaker:{Name}
"You mean Stu?"

#Speaker:Master Porthole
#pose:
#expression:
"Don't say his name! It gives him power."

#Speaker:{Name}
He slams his hand down the table, rattling its components. A beat passes before his shoulders sag and he becomes quieter.

#Speaker:Master Porthole
#pose:
#expression:
"...It's not about the food, you know."

#Speaker:Master Porthole
#pose:
#expression:
"It's about control, and how quickly I feel we're losing it."

* "You could’ve handled it better, y’know."
-> rory_q1_check

* "You weren’t wrong. He can be reckless."
-> rory_q1_backing

* "At least it wasn’t poisoned. Progress?"
-> rory_q1_joke

=== rory_q1_check ===
~ Rory_Affection -=5

#Speaker:{Name}
"You didn't need to have a royal meltdown."

#Speaker:Master Porthole
#pose:
#expression:
"I didn't have a meltdown. I made a point."

#Speaker:{Name}
"Yeah, and now Shad probably wants to souffle you."

#Speaker:Master Porthole
#pose:
#expression:
"...Maybe I am somewhat scared."

#Speaker:Master Porthole
#pose:
#expression:
"But it's better to be sharp and alive than poisoned to death."

-> rory_q2_intro

=== rory_q1_backing ===
~ Rory_Affection += 10 

#Speaker:Master Porthole
#pose:
#expression:
"Finally, someone who sees reason."

#Speaker:Master Porthole
#pose:
#expression:
"You sound more rattled than thos...reactive jars. Is everything alright?"

#Speaker:Master Porthole
#pose:
#expression:
"Careful, Captain. You keep talking like that and I'll start thinking you care."

#Speaker:{Name}
"I do."

#Speaker:Master Porthole
#pose:
#expression:
"...Dangerous sentiment, that. Especially when it comes to someone like me."

-> rory_q2_intro

=== rory_q1_joke ===

#Speaker:Master Porthole
#pose:
#expression:
"With Shad, it's a coin toss. Next time I might start sprouting gills."

#Speaker:{Name}
"You'd look great with gills, gives you that hydrodynamic flair."

#Speaker:Master Porthole
#pose:
#expression:
"...Thank you. I think."

-> rory_q2_intro

=== rory_q2_intro ===

#Speaker:{Name}
He rubs his templed, stress bleeding through.

#Speaker:Master Porthole
#pose:
#expression:
"Truthfully...it's the Kraken."

#Speaker:{Name}
He finally says it out loud.

#Speaker:Master Porthole
#pose:
#expression:
"You know, I've dreamt of monsters since I was five. The kraken, sea serpent and all...but never once did they wait like this."

#Speaker:Master Porthole
#pose:
#expression:
"The silent sails is worse. It's like the sea is holding its breath, like something is about to reach out and -"

#Speaker:{Name}
"Master Porthole."

#Speaker:Master Porthole
#pose:
#expression:
"I don't want to die. Not before I...not before I prove I was more than what they prophesised for me."

* "You’re already more than that. I see it."
-> rory_q2_reassure

* "Then stop whining and act like it."
-> rory_q2_toughlove

* If you cry during the Kraken battle, I’m telling everyone."
-> rory_q2_joke

=== rory_q2_reassure ===
~ Rory_Affection += 10 

#Speaker:Master Porthole
#pose:
#expression:
"If you keep saying such sweet things, I might just start scribbling your name into my margins like a love sick fool."

#Speaker:{Name}
"Oh? Have you not been doing that already. I'm deeply hurt."

#Speaker:Master Porthole
#pose:
#expression:
"Ah, to entertain me so effortlessly. You must be after my heart."

-> rory_q3_intro

=== rory_q2_toughlove ===
~ Rory_Affection -=5

#Speaker:Master Porthole
#pose:
#expression:
"Hard, brutal even. Not very much of a pep talk, Captain {Name}."

#Speaker:{Name}
"Look, I feel sometimes you just need to say it as it is."

#Speaker:Master Porthole
#pose:
#expression:
"Very well - keep up that irritating commanding nature of yours."

-> rory_q3_intro

=== rory_q2_joke ===
~ Rory_Affection += 5

#Speaker:Master Porthole
#pose:
#expression:
"How comforting."

#Speaker:{Name}
"Just trying to lighten your mood, Master P."

#Speaker:Master Porthole
#pose:
#expression:
"You have a talent for being audacious." 

#Speaker:Master Porthole
#pose:
#expression:
"It has however seemed to clear my mind a bit."

#Speaker:{Name}
"Knew you couldn't resist me."

-> rory_q3_intro

=== rory_q3_intro ===

#Speaker:Master Porthole
#pose:
#expression:
"Listen...you deserve to know something. I'm not just 'Master Porthole', ship navigator and aesthetic pleasure."

#Speaker:{Name}
"Oh gods. Are you about to announce you're a secret agent."

#Speaker:{Name}
"Look, we're pirate we're not paying any goddamn taxes."

#Speaker:Master Porthole
#pose:
#expression:
~ roryTrueName = true
"...Not quite. My name is Rory, Rory Windsor. Heir to the empirical throne."

#Speaker:{Name}
"...you're kidding."

#Speaker:Master Porthole
#pose:
#expression:
"I would never joke about titles, or trauma, or fashion trends."

#Speaker:{Name}
"Why didn't you tell me?"

#Speaker:Master Porthole
#pose:
#expression:
"Well i'm a runaway prince. I think it's self explanatory."

#Speaker:Master Porthole
#pose:
#expression:
"And besides, I wanted to be chosen for who I am - not the blood I carry."

* "So, you're royalty and emotionally damaged? Great combo." 
    -> rory_q3_flirty
* "Right. And what are we supposed to do with that now?" 
    -> rory_q3_disinterested
* "We would have treated you like a normal person, titles don't mean anything on a pirate ship."
    -> rory_q3_neutral

=== rory_q3_flirty ===
~ Rory_Affection += 10 

#Speaker:{Name}
"So you're royalty and emotionally damaged? My favourite combo."

#Speaker:Master Porthole
#pose:
#expression:
"Don't tempt me, Captain. You have no idea how attractive that sounds coming from you."

#Speaker:Master Porthole
#pose:
#expression:
"One day i'll reward you for your exquisiteness."

#Speaker:{Name}
"I'm looking forward to it."

-> rory_q4_intro

=== rory_q3_disinterested ===
~ Rory_Affection -=5

#Speaker:Master Porthole
#pose:
#expression:
"You could start by having me not arrested, stabbed or stolen in the middle of the night."

#Speaker:{Name}
"No promises on the stabbing."

#Speaker:Master Porthole
#pose:
#expression:
"Charming, why precisely is that the one you won't promise?"

#Speaker:{Name}
"You know yourself, making enemies is second nature to you."

#Speaker:Master Porthole
#pose:
#expression:
"Touche."

-> rory_q4_intro

=== rory_q3_neutral ===
~ Rory_Affection +=5

#Speaker:{Name}
"Or were you royally scared of vulnerability?"

#Speaker:Master Porthole
#pose:
#expression:
"I am scared - I'm just scared with a hint of elegance."

#speaker:{Name}
"Elegance doesn't fend off monsters or fears."

#Speaker:{Name}
"But a crew does, we got your back no matter your origin."

#Speaker:Master Porthole
#pose:
#expression:
"That's quite genuiene of you...thanks."

-> rory_q4_intro

=== rory_q4_intro ===

#Speaker:Master Porthole
#pose:
#expression:
"I just hope this knowledge doesn't affect anything."

* "It's... a lot. But I trust you."
-> rory_exit_flirty

* "I’m still processing. Prince or not, earn your place."
-> rory_exit_disinterested

=== rory_exit_flirty ===
~ Rory_Affection += 10
~ rory_exit_type = "flirty"

#Speaker:Master Porthole
#pose:
#expression:
"Captain {Name}, if you every betray me...I'll still write sonnets about you."

#Speaker:Master Porthole
#pose:
#expression:
"Bloody ones, of course - but sonnets nevertheless."

#Speaker:{Name}
"I'll keep that in mind."

#Speaker:Master Porthole
#pose:
#expression:
"One day, I might give you the world. All the jewels your heart can desired, soaked in moonlit glow."

#Speaker:{Name}
"That's oddly romantic...and midly concerning."

#Speaker:Master Porthole
#pose:
#expression:
"Concerning? Good. I want to haunt your dreams, and maybe your quarters."

#Speaker:{Name}
His fingers brush against mine - it's slow, deliberate and just enough to make my pulse flicker.

#Speaker:{Name}
Not wanting to make reckless choices, I distract myself by scanning my surroundings. I notice he has new items on display

#Speaker:{Name}
(Let's try talking about those.)

-> END

=== rory_exit_disinterested ===
~ Rory_Affection -=5
~ rory_exit_type = "disinterested"

#Speaker:Master Porthole
#pose:
#expression:
"Fair. No crown ever earned trust without effort."

#Speaker:{Name}
"Exactly. We sail together, but we prove ourselves alone."

#Speaker:Master Porthole
#pose:
#expression:
"...I'll win your approval but don't underestimate my methods."

#Speaker:{Name}
He forces a smirk and returns to his maps.

#Speaker:{Name}
As i'm leaving I see a new object shimmer in my peripheral. When did he get that?

#Speaker{Name}
(Let's ask him.)
-> END
