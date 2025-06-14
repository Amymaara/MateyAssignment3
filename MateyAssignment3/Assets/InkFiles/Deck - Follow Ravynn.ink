INCLUDE Globals.ink

-> follow_ravynn_deck

=== follow_ravynn_deck ===

#Speaker:{Name}
The deck is still. No more tension, nor argument. Just the sound of the sea and the sight of Ravynn - slumped against a crate.

#Speaker:{Name}
I walk to towards her, she notices me approaching but doesn't tell me to leave. That's a start.

#Speaker:Ravynn
#pose:
#expression:
"You always follow people after fights, Captain {Name}? Or am I just special?"

#Speaker:{Name}
You're special.

#Speaker:{Name}
"But I also don't like leaving things hanging, especially with everything coming up."

#Speaker:Ravynn
#pose:
#expression:
"I hate this part, the waiting. The silence before the storm."

#Speaker:{Name}
She lefts out a sigh, a sharp and tired one.

#Speaker:{Name}
"Is that why you snapped at Pearl?"

#Speaker:{Name}
She doesn't answer me immediately, she just runs her fingers along the side of her notebook.

#Speaker:Ravynn
#pose:
#expression:
"Maybe. Maybe I'm just tired of pretending things aren't getting to me."

* "You okay? You seemed… more rattled than usual."
    -> ravynn_q1_concern
* "You were right to be mad. She crossed a line." 
    -> ravynn_q1_support
* "You two really know how to kill the vibe."
    -> ravynn_q1_neutral

=== ravynn_q1_concern ===
~ Ravynn_Affection += 10

#Speaker:Ravynn
#pose:
#expression:
"I don’t do well with distractions. Not this close to... everything."

-> ravynn_q2_intro

=== ravynn_q1_support ===
~ Ravynn_Affection += 0

#Speaker:Ravynn
#pose:
#expression:
"I don’t need you to take my side, Captain."

#Speaker:Ravynn
"But I appreciate not having to be the villain every time I ask for silence."

-> ravynn_q2_intro

=== ravynn_q1_neutral ===
~ Ravynn_Affection -= 5

#Speaker:Ravynn
#pose:
#expression:
"This isn’t about vibes. It’s about survival."

-> ravynn_q2_intro

=== ravynn_q2_intro ===

#Speaker:{Name}
She’s staring at the sea now. I follow her gaze, and get lost in the waves as well.

#Speaker:Ravynn
#pose:
#expression:
"When I was younger, I used to think battles were about glory. That if I trained hard enough, led well enough, nothing bad would ever happen."

#Speaker:Ravynn
#pose:
#expression:
"Then the sea taught me differently. And now… now the silence before something big feels like the only thing that holds me together."

* "That fear means you care. It’s not weakness."
    -> ravynn_q2_comfort
* "Maybe you’re not scared of the Kraken. Maybe you’re scared of losing control."
    -> ravynn_q2_challenge
* "So what if we die? At least you won’t have to argue with Pearl anymore."
    -> ravynn_q2_deflect
    
=== ravynn_q2_comfort ===
~ Ravynn_Affection += 10 

#Speaker:Ravynn
#pose:
#expression:
"Easy to say when we're not mere hours away from death."

-> ravynn_q3_intro

=== ravynn_q2_challenge ===
~Ravynn_Affection += 5

#Speaker:Ravynn
#pose:
#expression:
"Wouldn't you be? Out here, control is the only thing we've got to protect ourselves."

-> ravynn_q3_intro

=== ravynn_q2_deflect ===
~ Ravynn_Affection -= 5

#Speaker:Ravynn
#pose:
#expression:
"Don't joke about that."

#Speaker:{Name}
Her tone is sharper than the dagger she carries. I decide not to push further.

-> ravynn_q3_intro

=== ravynn_q3_intro ===

#Speaker:Ravynn
#pose:
#expression:
"You know...I didn't always used to be like this."

#Speaker:{Name}
"Oh? What did you used to be like? I find it hard to imagine you any other way."

#Speaker:Ravynn
#pose:
#expression:
"I used to...write things. Fictions. Stories."

#Speaker:{Name}
"Seriously?"

#Speaker:Ravynn
#pose:
#expression:
"Don't look so shocked. Discipline and imagination aren't mutually exclusive."

#Speaker:{Name}
"What kind of stories?"

#Speaker:Ravynn
#pose:
#expression:
"...They were ridiculous."

#Speaker:{Name}
"You just called Pearl's singing an auditory war crime, it can't be that bad."

#Speaker:Ravynn
#pose:
#expression:
"...Monster fanfiction."

#Speaker:{Name}
I could feel my jaw dropping to the floor.

#Speaker:{Name}
"I'm sorry - what?"

#Speaker:Ravynn
#pose:
#expression:
"Monster. Fanfiction."

#Speaker:Ravynn
#pose:
#expression:
"You know - tentacles, werewolf mates, enemies to lovers with sea monster - all that."

#Speaker:{Name}
"Wait..are you joking?"

#Speaker:Ravynn
#pose:
#expression:
"Not even remotely. Ever heard of the name 'R. Seaduction'?"

#Speaker:{Name}
"Oh my god. R. Seaduction as in the author of 'Drenched in Desire: A Sea Withches Curse'?

#Speaker:Ravynn
#pose:
#expression:
"...Yes."

#Speaker:{Name}
"...I'm lost for words."

#Speaker:Ravynn
#pose:
#expression:
"Don't make it worse."

* "Honestly? That’s kind of hot."
    -> ravynn_q3_flirty
* "I don’t even know what to say to that."
    -> ravynn_q3_weirded
* "I think it’s cool. Writing takes guts."
    -> ravynn_q3_respect

=== ravynn_q3_flirty ===
~ Ravynn_Affection += 10 

#Speaker:Ravynn
#pose:
#expression:
"...I knew you were weird."

-> ravynn_exit

=== ravynn_q3_weirded ===
~ Ravynn_Affection -= 10 

#Speaker:Ravynn
#pose:
#expression:
"You could try not judging for once."

-> ravynn_exit

=== ravynn_q3_respect ===

#Speaker:Ravynn
#pose:
#expression:
"Not as many guts as fighting sea monsters, but close."

-> ravynn_exit

=== ravynn_exit ===

#Speaker:{Name}
She exhales, it's not a sigh but something softer. It's softer than anything I've heard from her.

#Speaker:Ravynn
#pose:
#expression:
"I dont talk about this stuff. With anyone. So if you repeat even a word of it - I'll gut you like a fish."

* "I’d like to read your work sometime — maybe accompanied by a candlelit dinner."
    -> ravynn_exit_flirty
* "Don’t worry. Your secret’s safe with me, R. Seaduction."
  -> ravynn_exit_disinterested
 
 === ravynn_exit_flirty ===
 ~ ravynn_exit_type = "flirty"
 ~ Ravynn_Affection += 10 
 
 #Speaker:Ravynn
#pose:
#expression:
"Stars above. I'm going to regret trusting you, aren't I?"

#Speaker:{Name}
"Probably, but it'll be fun to tease you about it."

#Speaker:Ravynn
#pose:
#expression:
"Watch your back."

#Speaker:{Name}
"Quite the harsh reply, R. Seaduction. Have you ever wrote fanfiction of me?"

#Speaker:Ravynn
#pose:
#expression:
"Maybe, I would tell you the contents but I don't think it's an appropriate topic for when i'm on the clock."

#Speaker:{Name}
"Oh? Should we discuss this further after you're done with your work?"

#Speaker:Ravynn
#pose:
#expression:
"Maybe I'll pay a visit to your quarters if we survive the battle."

#Speaker:{Name}
I'm not sure if it's the sun or her words that are burning me up. She smirks and continues to count rations.

#Speaker:{Name}
I'm not one for asking fate for help, but I pray we win this battle.

-> END

=== ravynn_exit_disinterested ===
~ Ravynn_Affection -=5
~ ravynn_exit_type = "disinterested"

#Speaker:Ravynn
#pose:
#expression:
"Good."

#Speaker:{Name}
"You're welcome."

#Speaker:Ravynn
#pose:
#expression:
"...Thanks for listening, I guess."

#Speaker:{Name}
"You're more than just harsh words and blades, you know."

#Speaker:Ravynn
#pose:
#expression:
"Maybe. But those are the paths that help me survive."

#Speaker:{Name}
She goes back to her ledger. She doesn't stop me as I leave.

-> END
 
