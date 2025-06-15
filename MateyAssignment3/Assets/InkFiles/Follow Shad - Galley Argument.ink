INCLUDE Globals.ink

-> follow_shad_galley

=== follow_shad_galley ===

#Speaker:{Name}
Shad is still in the Galley, sleeves rolled up and furiously chopping herbs like they owe him money.

#Speaker:{Name}
The air is thick with the leftover tension...and fermented horseradish. Definetely horseradish.

#Speaker:{Name}
"That banana really caused quite the issue, huh?"

#Speaker:Shad
#pose:
#expression:
"He called it gastrointestinal sabotage. Like I was trying to kill everyone off by adding flavour to the dish."

#Speaker:{Name}
"To be fair, it did smell like a fusion of a musty landfill and spice market."

#Speaker:Shad
#pose:
#expression:
"I was trying to give people something new, something jouful. But apparently joy is off the menu now."

#Speaker:{Name}
He tosses a sprig of parsley into the wastebin and sighs.

* "It was a bold move, though. Maybe wait until after the kraken?"
    -> shad_q1_softcrit

* "Honestly, I think Master Porthole overreacted."
    -> shad_q1_support

* "Let’s just admit it was cursed and move on."
    -> shad_q1_joke

=== shad_q1_softcrit ===
~ Shad_Affection -=5

#Speaker:{Name}
"Some risks are worth taking, but maybe not this one."

#Speaker:Shad
#pose:
#expression:
"I guess that makes sense. It just...kinda sucks, y'know? I only wanted to help."

-> shad_q2_intro

=== shad_q1_support ===
~ Shad_Affection +=10 

#Speaker:{Name}
"He probably wanted something sage. You were trying to lift spirits, through. That's never the wrong choice."

#Speaker:Shad
#pose:
#expression:
"Exactly! The crews terrified, heck I sure know I am. But food can help say things words can't."

#Speaker:Shad
#pose:
#expression:
"And i've never been one to word things correctly, I show it through acts of kindness and out my feelings into the meal I make. I know if people just gave it a chance it would get through to them."

-> shad_q2_intro 

=== shad_q1_joke ===
~ Shad_Affection +=5

#Speaker:{Name}
"It sure smelt haunted, but hey at least it was memorable."

#Speaker:Shad
#pose:
#expression:
"Infamous dishes are a form of both legacy and delicacy."

#Speaker:{Name}
"Let the kraken be the legacy and save the delicacies for after our victory."

#Speaker:{Name}
"It's best practise not to experiment during battle prep."

#Speaker:Shad
#pose:
#expression:
"...Fair."

-> shad_q2_intro

=== shad_q2_intro ===

#Speaker:{Name}
His knife stills mid-slice.

#Speaker:Shad
#pose:
#expression:
"I'm not actually scared of Master Porthole, y'know. I'm scared of what comes next."

#Speaker:{Name}
"The kraken?"

#Speaker:Shad
#pose:
#expression:
"It's not just the kraken. It's also know knowing - I've never been in this position before. I feel like a fish out of water."

#Speaker:Shad
#pose:
#expression:
"I just...I've never been apart of a sea battle. Let alone with the Kraken it's all so new to me."

* "It’s okay to admit you’re scared. We all are."
    -> shad_q2_empathy

* "Then stop second guessing your instincts."
    -> shad_q2_push

* "You know what I do when I’m scared? Panic. Highly effective."
    -> shad_q2_joke

=== shad_q2_empathy ===
~ Shad_Affection +=10 

#Speaker:{Name}
"It's not a weakness to feel things. You just happen to feel things through...carbs and apparently fermented ingredients."

#Speaker:Shad
#pose:
#expression:
"I knew there was a reason I liked you."

#Speaker:{Name}
"You know, I don't think fermented foods are all that bad. I guess you could say, I'm cultured."

#Speaker:Shad
#pose:
#expression:
"Captain {Name}... was that a pun?"

#Speaker:{Name}
"Yes...lettuce move past that."

#Speaker:Shad
#pose:
#expression:
"Yes, let that romaine in the past."

-> shad_q3_intro

=== shad_q2_push ===
~Shad_Affection -=5

#Speaker:{Name}
"Fear is fine. Freezing isn't. If you mess up I wont hesitate to drop liabilities."

#Speaker:Shad
#pose:
#expression:
"You're make a terrifying sous chef."

#Speaker:{Name}
"If I was a chef, I wouldn't be a sous chef."

#Speaker:Shad
#pose:
#expression:
"Right...got it."

-> shad_q3_intro

=== shad_q2_joke ===
~ Shad_Affection +=5

#Speaker:{Name}
"Jokes aside, when i'm scared I just pretend to be invincible. It's gotten me through everything thus far."

#Speaker:Shad
#pose:
#expression:
"That's actually not bad advice."

#Speaker:{Name}
"You think I'm a captain just by chance?"

#Speaker:{Name}
"I have to be able to ease the nerves of my crew and rough the waves, if I can't do any of that - I don't deserve this title."

#Speaker:Shad
#pose:
#expression:
"ALright I'll try it. It might not be foolproof but if you've gone as far as to give me advice, I'll try my best to make it work."

-> shad_q3_intro

=== shad_q3_intro ===

#Speaker:Shad
#pose:
#expression:
"Cap'n {Name}, there's something I haven't told anyone yet."

#Speaker:{Name}
He opens a bottle and gently unfurls a half faded piece of parchement

#Speaker:Shad
#pose:
#expression:
"My great gram gram once made a dish so good it make a navy general weep. She never shared it with anyone but sent the recipe in a bottle out to sea."

#Speaker:Shad
#pose:
#expression:
"I-I came upon this a few months ago and I think it might be hers. It's heavily faded but it feels like home, like family,"

#Speaker:Shad
#pose:
#expression:
"I've been trying to recreate it from scraps and guessing. All my experiments, even the banana from earlier is me trying to make this."

#Speaker:{Name}
"It sounds like a culinary treasure hunt to me"

#Speaker:Shad
#pose:
#expression:
"Exactly, and I want to make it real again. Before... there's no one left to remember her cooking."

* "That’s kind of beautiful. I’d like to taste it too."
    -> shad_q3_flirtylead

* "You’re chasing food ghosts. Focus on what’s in front of you."
    -> shad_q3_disinterestedlead

* "Maybe leave the banana out next time, yeah?"
    -> shad_q3_neutrallead
    
=== shad_q3_flirtylead ===
~Shad_Affection += 10 

#Speaker:{Name}
"But then again, I'd try anything you made. Even if it kills me."

#Speaker:Shad
#pose:
#expression:
"Tempting me with loyalty and mild recklessness? Careful, Cap'n {Name} - I fall hard for that combo."

#Speaker:{Name}
"Even better."

#Speaker:Shad
#pose:
#expression:
"But can't have you croaking out on me just yet - I got a whole lotta recipe's I'd love for you to try."

-> shad_q4_intro

=== shad_q3_disinterestedlead ===
~ Shad_Affection -=5

#Speaker:{Name}
"It's a nice goal, but right now - we need you grounded. No distractions."

#Speaker:Shad
#pose:
#expression:
"Right, Food is just fuel. I get it."

#Speaker:{Name}
"There's times for dreams, but right now you have to face reality."

#Speaker:Shad
#pose:
#expression:
"Yup, i'll just put this on hold."

-> shad_q4_intro    

=== shad_q3_neutrallead ===
~ Shad_Affection -=5

#Speaker:{Name}
"Or...tweak the ratio's. The idea's got heart, but the execution needs a little work."

#Speaker:Shad
#pose:
#expression:
"Oh! Heart and horseradish - why didn't I think of that."

#Speaker:{Name}
"Wait -"

#Speaker:Shad
#pose:
#expression:
"Hmm how do you ferment beef heart safely, wait doesn't cooking kill all the bad stuff anyways - should be fine!"

-> shad_q4_intro

=== shad_q4_intro ===

#Speaker:{Name}
He leans back, finally breathing a little easier.

#Speaker:Shad
#pose:
#expression:
"So what do you think Cap'n - can I one day achieve this?"

#Speaker:{Name}
"You mean completing the recipe?"

#Speaker:Shad
#pose:
#expression:
"Yeah."

* "I believe in your dream. Just don’t forget to survive first."
    -> shad_exit_flirty

* "I respect your passion. But I don’t think I’m the one to encourage it."
    -> shad_exit_disinterested

=== shad_exit_flirty ===
~ Shad_Affection += 10
~ shad_exit_type = "flirty"

#Speaker:Shad
#pose:
#expression:
"When this is all over, maybe I'll make you be the first to taste it - privately of course."

#Speaker:{Name}
"In the Galley?"

#Speaker:Shad
#pose:
#expression:
"No, somewhere quieter. Candlelights and possible missing shirts."

#Speaker:{Name}
"You had me at somewhere quieter."

#Speaker:{Name}
He smirks and continues to stir the pots.

#Speaker:{Name}
As I turn to leave, something new catches my eye near the spice rack.

#Speaker:{Name}
(What’s that? Let’s ask.)

-> END

=== shad_exit_disinterested ===
~ Shad_Affection -= 5
~ shad_exit_type = "disinterested"

#Speaker:Shad
#pose:
#expression:
"Right. Dreams are a luxury. Got it."

#Speaker:{Name}
"That’s not what I - "

#Speaker:Shad
#pose:
#expression:
"I’ll get back to stirring. You go command stuff."

#Speaker:{Name}
Before I can say more, he turns away and grabs another pot.

#Speaker:{Name}
My eyes catch something new as I'm leaving.

#Speaker:{Name}
(Let's ask about it)

-> END




