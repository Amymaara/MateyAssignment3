INCLUDE Globals.ink

-> shad_intro

=== shad_intro ===
#speaker:Stu
"Wait… What’s that smell. It smells like burning sugar and nightmares. Let’s go to the Galley. Shad should be there."

#speaker:{Name}
The door creaks open and I’m immediately hit with an odour.  
I can’t quite place it. It’s sweet? Salty? Concerning?

There’s a big guy in the middle of what seems to be a culinary experiment gone wrong. There’s sugar, anchovies, and burnt remnants of something I’d rather not guess.

#speaker:Shad
"Don’t step there! The pie’s cooling and it may be sentient."

#speaker:Shad
"Oh huh, {Name}? I didn’t realise it was you. I wanted to make a welcome pie but it sort of started making itself halfway through. I'm a bit spooked but definitely proud of the lil guy."

#Speaker:{Name}
(Why is he acting like this is completely normal kitchen behaviour?)  
I look to the pie on the counter and I swear, solemnly swear I saw it wriggle.

* [React to the...science experiment]
    ~ Shad_Affection += 10
    #speaker:{Name}
    "What in Poseidon’s name are you concocting down here?"

    #speaker:Shad
    "A lot of food with a pinch of love, and sometimes consciousness."

    -> shad_kitchen_story

* [Point out the bubbling terror]
    ~ Shad_Affection += 0
    #speaker:{Name}
    "Should I be concerned about the bubbling jar of slime on the counter?"

    #speaker:Shad
    "Is that not how it’s supposed to be?"

    -> shad_kitchen_story

* [Comment on the chaos]
    ~ Shad_Affection -= 10
    
    #speaker:{Name}
    "The galley’s in a state of chaos, what happened?"

    #speaker:Shad
    "Yeah I’m sorry, I had my recipe book upside down so all the ingredients and numbers were messed up..."

    -> shad_kitchen_story

=== shad_kitchen_story ===
#speaker:Shad
"The kitchen is great though! Way sturdier than my last one — that one exploded twice, on the same day."

#speaker:{Name}
"How does a kitchen explode twice?"

#speaker:Shad
"Soup is highly flammable when it has emotions."

#speaker:Shad
"Haha, anyways. I’m Shad! Pirate chef. "

"Well, actually I read the ad wrong. I mix up my words sometimes. I thought it said 'Pie-rate chef' — you know, a chef that rates pies."

"But it’s okay! I figured I'd go with it. Improvisation is my strong point!"

#speaker:Shad
"You hungry? I tried making something called 'soul' food. For your soul, you know?"

* [Backhanded sunshine]
    ~ Shad_Affection += 10
    
    #speaker:{Name}
    "You’re like the sun if it put on an apron and caused mild property damage."

    #speaker:Shad
    "That might be the best compliment I’ve ever gotten! I’m writing that on my gravestone!"

    (I watch as he scrambles to jot something down in his book.)

    -> shad_exit

* [Set your standards low]
    ~ Shad_Affection += 0
    
    #speaker:{Name}
    "As long as you don’t poison me, we’ll get along fine."

    #speaker:Shad
    "I can promise… I’ll try not to!"

    -> shad_exit

* [A pie vs a kraken? Tough call]
    ~ Shad_Affection-= 10
    
    #speaker:{Name}
    "I think you might be a bigger danger than the sea monster."

    #speaker:Shad
    "Y’know, everyone always tells me that. I don’t try to be… I just am."

    -> shad_exit

=== shad_exit ===
#speaker:Shad
"Anyway — I’m still setting up my spice altar. Come by later and I’ll show you a meal that’s unforgettable. Hopefully in a good way this time!"

* [Wreck but charming]
    ~ Shad_Affection += 10
    
    #speaker:{Name}
    "You’re definitely a walking hazard, but you’re also kind of adorable."
 -> shad_exit_flirty
 
 * [seek culinary safety elsewhere]
  ~ Shad_Affection -= 10
  
 #speaker:{Name}
  "Good luck with whatever this is. I’m gonna try and find something to eat that’s not vaguely alive."
 -> shad_exit_disinterested
 
 === shad_exit_flirty ===
    #speaker:Shad
    "Aw shucks, Captain {Name} — you can’t say that to a guy without making ‘em blush."

    #speaker:{Name}
    "Well, if your food ends up killing me — at least I’d die smiling."

    #speaker:Shad
    "Huh, a romantic and a risk taker — you’re making my heart skip a beet."

My eyes casually wonder around, it catches a glimpse of something.
(I should ask him what that item is)

-> END

=== shad_exit_disinterested ===


#speaker:Shad
"Totally understandable, Cap’n — I did hope you could try my food but… maybe next time."

#speaker:{Name}
"That’s if the kitchen doesn’t explode before then."

I look at something, somewhat normal. I wonder what use or value it has.

(Ask him about the object)

-> END
