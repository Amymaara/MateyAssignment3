INCLUDE Globals.ink

-> rory_intro

=== rory_intro ===
#speaker:Stu
"We should definitely check out that suspicious guy. Hopefully he hasn’t royally fucked up or stolen anything."

#speaker:{Name}
I stepped into what used to be the ship’s study. Keyword: *used to*. Now it looked like a noble catalog threw up all over it with no restraints and a grudge against simplicity.

And the cause of it? Yup — there he was, standing by the window like a painting brought to life, letting the sunlight wash over his stupidly perfect bone structure.

#speaker:Master Porthole
"Oh? I was hoping to finish the renovating before the grand reveal, but... surprise, I suppose."

#speaker:Master Porthole
"You’re the Captain I assume? A little tardy but fashionably so."

#speaker:{Name}
"Not to be rude but who the hell are you?"

#speaker:Master Porthole
"Oh, right — the CV incident. Well, it’s obvious I prefer to let people *experience* me rather than read about it."

#speaker:Master Porthole
"My name is… Mast erhm Porthole. Yeah, that’ll do."

#speaker:{Name}
"Master Porthole? You’re kidding, right?"

#speaker:Master Porthole
"Unfortunately no. My mother was quite fond of windows."

#speaker:{Name}
(Okay. Time to react to that name…)

* ["That name sounds... character-building"]
    ~ Rory_Affectionn -= 10
    
    #speaker:{Name}
    "Yeah, I’m not gonna lie — that’s an awful name."

    He looks at me as if I murdered his child.

    #speaker:Master Porthole
    "Well I suppose you’re not burdened with taste."

    -> rory_flooring

* ["Touching sentiment, truly"]
 ~ Rory_Affection += 10
 
    #speaker:{Name}
    "It’s heartwarming that she named you after something she loved so dearly."

    #speaker:Master Porthole
    "How strangely sincere of you."
   
    -> rory_flooring

* ["Sounds fake, but alright"]
 ~ Rory_Affection += 0
 
    #speaker:{Name}
    "That sounds like a fake name."

    #speaker:Master Porthole
    "Touché. Let’s just say it’s a… placeholder, for now."
   
    -> rory_flooring

=== rory_flooring ===
#speaker:Master Porthole
"Regardless, let’s focus on more pressing matters, like how the flooring completely clashes with my desk."

#speaker:Master Porthole
"It’s absolutely tragic. That wood under my desk? It utterly cheapens it."

#speaker:{Name}
"Easy there, it took me a lot to get this ship. It might not amount to much, but she’s mine."

"Getting her was not easy. Just thinking about it is giving me war flashbacks."

* ["There was… a troll involved"]
    -> rory_troll
* ["Wasn’t sober, wasn’t smart"]
    -> rory_drunk
* ["Found it. Claimed it. Ship happens."]
    -> rory_deed

=== rory_troll ===
~ Rory_Affection += 0

#speaker:{Name}
"I had to wrestle a troll for it. That was quite the experience."

#speaker:Master Porthole
"A troll wrestling another troll? Must have been quite the sight."

-> rory_tone

=== rory_drunk ===
~ Rory_Affection -= 10

#speaker:{Name}
"I bought this drunk off my mind. I think I traded my life savings... and possibly my soul."

#speaker:Master Porthole
"Well that’s laughably irresponsible of you. Are you even qualified for this job?"

-> rory_tone

=== rory_deed ===
~ Rory_Affection += 10

#speaker:{Name}
"I found the title deed on the floor. You know what they say — finders keepers."

#speaker:Master Porthole
"A fellow opportunist? Good. You might survive me after all."

-> rory_tone

=== rory_tone ===
#speaker:{Name}
"Ever consider speaking more kindly? Your tongue is as sharp as your jawline."

(Did I just say that out loud?)

#speaker:Master Porthole
"I’m not here to be liked. I’m here to accomplish my goals and help you with whatever sea mishap gets thrown our way — including that overgrown calamari."

#speaker:Master Porthole
"I handle disaster best when dressed and surrounded by elegance and competence. I’d appreciate if you provided both."

* ["Gonna need a drink after this"]
    -> rory_exit_flirty
    
* ["Let's..not do this."]
    -> rory_exit_disinterested

=== rory_exit_flirty ===
#speaker:{Name}
"You’ve certainly left an impression, Master Porthole. One that I’ll need a strong glass of whiskey to process."

#speaker:Master Porthole
"Good. I’d be horrified if you forgot me that easily."

#speaker:{Name}
"Oh, no chance. You and that desk have fried my brain."

I turned around to leave, and I swear — *solemnly swear* — that I heard him say: "You’re welcome."

#speaker:Stu
"Squaaak, was that flirting or a verbal skirmish?"

#speaker:{Name}
"A little bit of both, I think? He complimented me with his eyes but insulted me with his tone."

#speaker:Stu
"High society courting terrifies me."

I glance back one last time. He’s already adjusting and aligning new pieces of furniture. I’m not sure if I want to kiss him or throw him overboard.


-> END

=== rory_exit_disinterested ===
#speaker:{Name}
"Just try not to redecorate the entire ship before dinner. That desk’s already giving me a migraine."

#speaker:Master Porthole
"Tragic. I’m afraid you’ll never get used to elegance."

#speaker:{Name}
"Or you’ll get used to the brig. Let’s see who adapts first."

(I was out before I associate that nauseating perfume with his ego. Nope — already done.)

#speaker:Stu
"You two get along as well as pirates and piranhas."

#speaker:{Name}
"Let’s just hope he’s better with a map than he is with decor."

I glance back at the room. He didn’t follow, but I’m 97% sure he’s scheming something to spite me. I’ve survived worse — like tentacles and emotional vulnerability.

-> END


