INCLUDE Globals.ink

-> shad_intro

=== shad_intro ===
#music_ShadMusic

#speaker:Stu
"Wait… What’s that smell? It smells like burning sugar and nightmares. Let’s go to the Galley. Shad should be there."

#speaker:{Name}
The door creaks open and I’m immediately hit with an odour.  
I can’t quite place it. It’s sweet? Salty? Concerning?

#speaker:{Name}
There’s a big guy in the middle of what seems to be a culinary experiment gone wrong. There’s sugar, anchovies, and burnt remnants of something I’d rather not guess.

#speaker:Shad
#pose:Pose3
#expression:Neutral
"Don’t step there! The pie’s cooling and it may be sentient."

#speaker:Shad
#pose:Pose3
#expression:Neutral
"Oh huh, {Name}? I didn’t realise it was you. I wanted to make a welcome pie but it sort of started making itself halfway through. I'm a bit spooked but definitely proud of the lil guy."

#Speaker:{Name}
(Why is he acting like this is completely normal kitchen behaviour?) 

#speaker:{Name}
I look to the pie on the counter and I swear, solemnly swear I saw it wriggle.


* "What in Poseidon’s name are you concocting down here?"
    ~ Shad_Affection += 10

    #speaker:Shad
 #pose:Default
#expression:Smile
    "A lot of food with a pinch of love, and sometimes consciousness."

    -> shad_kitchen_story

* "Should I be concerned about the bubbling jar of slime on the counter?"
    ~ Shad_Affection += 5

    #speaker:Shad
    #pose:Default
#expression:Neutral
    "Is that not how it’s supposed to be?"

    -> shad_kitchen_story

* "The galley’s in a state of chaos, what happened?"
    ~ Shad_Affection -= 5


    #speaker:Shad
    #pose:Default
#expression:Sad
    "Yeah I’m sorry, I had my recipe book upside down so all the ingredients and numbers were messed up..."

    -> shad_kitchen_story

=== shad_kitchen_story ===
#speaker:Shad
#pose:Default
#expression:Neutral
"The kitchen is great though! Way sturdier than my last one — that one exploded twice, on the same day."

#speaker:{Name}
"How does a kitchen explode twice?"

#speaker:Shad
#pose:Pose2
#expression:Neutral
"Soup is highly flammable when it has emotions."

#speaker:Shad
#pose:Default
#expression:Neutral
"Haha, anyways. I’m Shad! Pirate chef. "

#speaker:Shad
#pose:Default
#expression:Neutral
"Well, actually I read the ad wrong. I mix up my words sometimes. I thought it said 'Pie-rate chef' — you know, a chef that rates pies."

#speaker:Shad
#pose:Default
#expression:Neutral
"But it’s okay! I figured I'd go with it. Improvisation is my strong point!"

#speaker:Shad
#pose:Pose2
#expression:Neutral
"You hungry? I tried making something called 'soul' food. For your soul, you know?"

#speaker:{Name}
* "You’re like the sun if it wore an apron and caused mild property damage."
    ~ Shad_Affection += 10
  

    #speaker:Shad
    #pose:Default
#expression:Smile
    "That might be the best compliment I’ve ever gotten! I’m writing that on my gravestone!"

#Speaker:{Name}
    (I watch as he scrambles to jot something down in his book.)
    
    #Speaker:Shad
#pose:Pose3
#expression:Smile
"Also I didn't hear a no! You can be the first person to ever try my soul food...maybe the last."
    -> shad_exit

#speaker:{Name}
* "As long as you don’t poison me, we’ll get along fine."
    ~ Shad_Affection += 5

    #speaker:Shad
    #pose:Default
#expression:Neutral
    "I can promise… I’ll try not to!"

    -> shad_exit

* "I think you might be a bigger danger than any sea monster."
    ~ Shad_Affection -= 5

    #speaker:Shad
    #pose:Default
#expression:Sad
    "Y’know, everyone always tells me that. I don’t try to be… I just am."

    -> shad_exit

=== shad_exit ===
#speaker:Shad
#pose:Default
#expression:Neutral
"Anyway — I’m still setting up my spice altar. Come by later and I’ll show you a meal that’s unforgettable. Hopefully in a good way this time!"

* "You’re definitely a walking hazard, but you’re also kind of adorable."
    ~ Shad_Affection += 10
 -> shad_exit_flirty
 
 * "Good luck with whatever this is. I’m gonna try and find something to eat that’s not vaguely alive."
  ~ Shad_Affection -= 5
 -> shad_exit_disinterested
 
 === shad_exit_flirty ===
 #music_Flirty
 ~shad_exit_type = "flirty"
 
    #speaker:Shad
    #pose:Default
#expression:Blush
    "Aw shucks, Captain {Name} — you can’t say that to a guy without making ‘em blush."

    #speaker:{Name}
    "Well, if your food ends up killing me — at least I’d die smiling."

    #speaker:Shad
      #pose:Default
#expression:Smile
    "Huh, a romantic and a risk taker — you’re making my heart skip a beet."

#Speaker:{Name}
My eyes casually wander around, and they catch a glimpse of something.

#Speaker:{Name}
(I should ask him what that item is)

-> END

=== shad_exit_disinterested ===
~shad_exit_type = "disinterested"

#speaker:Shad
  #pose:Pose2
#expression:Sad
"Totally understandable, Cap’n — I did hope you could try my food but… maybe next time."

#speaker:{Name}
"That’s if the kitchen doesn’t explode before then."

#Speaker:{Name}
I look at something, somewhat normal. I wonder what use or value it has.

#Speaker:{Name}
(Ask him about the object)

-> END
