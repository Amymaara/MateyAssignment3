INCLUDE Globals.ink

-> rory_intro

=== rory_intro ===
#music_Celtic-moon-loop-1-284914

#speaker:Stu
"We should definitely check out that suspicious guy. Hopefully he hasn’t royally messed up or stolen anything."

#speaker:{Name}
I stepped into what used to be the ship’s study. Keyword: *used to*. Now it looked like a noble catalog threw up all over it with no restraints and a grudge against simplicity.

#speaker:{Name}
And the cause of it? Yup — there he was, standing by the window like a painting brought to life, letting the sunlight wash over his stupidly perfect bone structure.

#speaker:Master Porthole
#pose:Default
#expression:Neutral
"Oh? I was hoping to finish the renovating before the grand reveal, but... surprise, I suppose."

#speaker:Master Porthole
#pose:Default
#expression:Neutral
"You’re the Captain I assume? A little tardy but fashionably so."

#speaker:{Name}
"Not to be rude but who the hell are you?"

#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"Oh, right — the CV incident. Well, it’s obvious I prefer to let people *experience* me rather than read about it."

#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"My name is… Mast erhm Porthole. Yeah, that’ll do."

#speaker:{Name}
"Master Porthole? You’re joking, right?"

#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"Unfortunately no. My mother was quite fond of windows."

#speaker:{Name}
(Okay. Time to react to that name…)

* ["That name sounds... character-building."]
    ~ Rory_Affection -= 10
    
#speaker:{Name}
"That name sounds... character-building."

#speaker:{Name}
He looks at me as if I murdered his child.

#speaker:Master Porthole
#pose:Pose2
#expression:Angry
"Well, I suppose you’re not burdened with taste."

    -> rory_flooring

* ["It’s heartwarming that she named you after something she loved so dearly."]
 ~ Rory_Affection += 10
 
#speaker:{Name}
"It’s heartwarming that she named you after something she loved so dearly."

#speaker:Master Porthole
#pose:Pose2
#expression:Blush
"How strangely sincere of you."
   
    -> rory_flooring

* ["Sounds fake, but alright"]
 ~ Rory_Affection += 0
 
#speaker:{Name}
"Sounds fake, but alright"

#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
Touché. Let’s just say it’s a… placeholder, for now."
   
    -> rory_flooring

=== rory_flooring ===
#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"Regardless, let’s focus on more pressing matters, like how the flooring completely clashes with my desk."

#speaker:Master Porthole
#pose:Pose2
#expression:Neutral
"It’s absolutely tragic. That wood beneath my desk? It completely cheapens it."

#speaker:{Name}
"Easy there, it took me a lot to get this ship. It might not amount to much, but she’s mine."

#speaker:{Name}
"Getting her was not easy. Just thinking about it gives me war flashbacks."

#speaker:{Name}
* ["I had to wrestle a troll for it. That was quite the experience."]
    -> rory_troll
* ["I bought this drunk off my mind. I think I traded my life savings... and possibly my soul."]
    -> rory_drunk
* ["I found the title deed on the floor. You know what they say — finders keepers."]
    -> rory_deed

=== rory_troll ===
~ Rory_Affection += 0

#speaker:{Name}
"I had to wrestle a troll for it. That was quite the experience."

#speaker:Master Porthole
#pose:Pose3
#expression:Neutral
"A troll wrestling another troll? Must have been quite the sight."

-> rory_tone

=== rory_drunk ===
~ Rory_Affection -= 10

#speaker:{Name}
"I bought this drunk off my mind. I think I traded my life savings... and possibly my soul."

#speaker:Master Porthole
#pose:Pose3
#expression:Angry
"Well that’s laughably irresponsible of you. Are you even qualified for this job?"

-> rory_tone

=== rory_deed ===
~ Rory_Affection += 10

#speaker:{Name}
"I found the title deed on the floor. You know what they say — finders keepers."

#speaker:Master Porthole
#pose:Pose3
#expression:Blush
"A fellow opportunist? Good. You might survive me after all."

-> rory_tone

=== rory_tone ===
#speaker:{Name}
"Ever consider speaking more kindly? Your tongue's as sharp as your jawline."

#speaker:{Name}
(Did I just say that out loud?)

#speaker:Master Porthole
#pose:Pose3
#expression:Neutral
"I’m not here to be liked. I’m here to accomplish my goals and help you with whatever sea mishap gets thrown our way — including that overgrown calamari."

#speaker:Master Porthole
#pose:Pose3
#expression:Neutral
"I handle disaster best when draped in elegance and surrounded by competence. I’d appreciate if you provided both."

#speaker:{Name}
* ["You’ve certainly left an impression, Master Porthole. One that I’ll need a strong glass of whiskey to process."]
    -> rory_exit_flirty
    
* ["Just try not to redecorate the entire ship before dinner. That desk’s already giving me a migraine."]
    -> rory_exit_disinterested

=== rory_exit_flirty ===
~Rory_Affection += 10 
~ rory_exit_type = "flirty"
#speaker:{Name}
"You’ve certainly left an impression, Master Porthole. One that I’ll need a strong glass of whiskey to process."

#speaker:Master Porthole
#pose:Pose3
#expression:Neutral
"Good. I’d be horrified if you forgot me that easily."

#speaker:{Name}
"Oh, no chance. You and that desk have fried my brain."

#speaker:{Name}
My eyes catch on something of his.

#speaker:{Name}
(I wonder what this is about, let's try asking.)

-> END

=== rory_exit_disinterested ===
~Rory_Affection -= 10 
~ rory_exit_type = "disinterested"

#speaker:{Name}
"Just try not to redecorate the entire ship before dinner, yeah? That desk’s already giving me a migraine."

#speaker:Master Porthole
#pose:Pose3
#expression:Angry
"Tragic. I’m afraid you’ll never get used to elegance."

#speaker:{Name}
"Or you’ll get used to the brig. We'll see who adapts first."

#speaker:{Name}
As I head out I see something obnoxious, I decide to let him yap to me about it.

#speaker:{Name}
(I should ask his what this is)

-> END


