INCLUDE Globals.ink

-> follow_pearl_room

#disable:Pearl
=== follow_pearl_room ===
#music_PearlMusic

#Speaker:{Name}
I knock lightly before entering pearls quarters.

#Speaker:{Name}
The familiar smell of salt, lavender and something vaguely fishy greets me. Only, this time Pearl is no longer humming or monologuing. 

#Speaker:{Name}
She's facing the wall, hidden behind something - I can't quite make her out clearly.

#Speaker:{Name}
"Pearl?"

#speaker:Pearl
"Go away, don't look."

#Speaker:{Name}
"I'm not going anywhere."

#Speaker:{Name}
She turns around, slowly. I understand now.

#Speaker:{Name}
Where her torso should be...is not there. Scaled fins shimmer in the place of flesh, sharp and beautiful but completely wrong.

#Speaker:{Name}
She's standing awkwardly, well her human legs are, on what looks like a pile of soaked blankets.

#speaker:Pearl
#pose:Mermaid
#activate:Pearl
"Reverse mermaid. Fish tail, human top? Nope. I got the deal no one's ordering on the menu."

#speaker:Pearl
#pose:Mermaid
"Surprise. I'm the world's least convenient sea creature."

#Speaker:{Name}
She looks at me - waiting, or more like bracing for my reply.

* "You’re still you, Pearl. Fins, scales, bad singing and all."
    -> pearl_reveal_positive
* "...So, does this mean you breathe through your neck now?"
    -> pearl_reveal_weird
* "You lied to me."
    -> pearl_reveal_negative
    
=== pearl_reveal_positive ===
~ Pearl_Affection += 10 

#speaker:Pearl
#pose:Mermaid
"You really know how to make a lady feel normal, huh?"

-> pearl_q1_intro

=== pearl_reveal_weird ===
~ Pearl_Affection += 5

#speaker:Pearl
#pose:Mermaid
"Okay...not where I thought this conversation was heading, but sure."

#speaker:Pearl
#pose:Mermaid
"Bonus points for originality, I suppose?"

-> pearl_q1_intro

=== pearl_reveal_negative ===
~ Pearl_Affection -= 5

#speaker:Pearl
#pose:Mermaid
"I didn't lie. I just...didn't tell you. There's a difference."

#speaker:Pearl
#pose:Mermaid
"But hey, if honestly is all it takes to sink this ship. Maybe I dodged something worse."

-> pearl_q1_intro

=== pearl_q1_intro ===

#Speaker:{Name}
She flops, quite literally, onto a pile of blankets and sighs.

#speaker:Pearl
#pose:Mermaid
"Ravynn was right, you know. About me being reckless."

#Speaker:{Name}
"I don't think she meant it that way."

#speaker:Pearl
#pose:Mermaid
"She didn't need to. You don't spend your life being...this."

#Speaker:{Name}
She gestures to her reverse mermaid form, or tries to. Her hands? fins? are quite short.

#speaker:Pearl
#pose:Mermaid:
"...without learning to hear the truth behind behinds words."

#speaker:Pearl
#pose:Mermaid
"I try to laugh, to sing, to keep the mood light. But it's just -"

#speaker:Pearl
#pose:Mermaid
"It's just noise, isn't it? Just noise while I distract myself from the way people judge me."

* "You’re more than just a distraction."
    -> pearl_q2_positive
* "Ravynn was just stressed. Don’t take it to heart." 
    -> pearl_q2_neutral
* "You do cause chaos sometimes." 
    -> pearl_q2_negative
    
=== pearl_q2_positive ===
~ Pearl_Affection += 10

#Speaker:{Name}
"You’re not noise. You’re the only thing that makes this ship feel like it has a soul sometimes."

#speaker:Pearl
#pose:Mermaid
"...You're either very good at lying, or worse, being sincere."

#Speaker:{Name}
"Terrifying, huh?"

#speaker:Pearl
#pose:Mermaid
"More than the Kraken, honestly."

#Speaker:{Name}
She smiles or I think it's a smile. Her terminal mouth opens a bit.

-> pearl_q3_intro

=== pearl_q2_neutral ===
~ Pearl_Affection += 5

#Speaker:{Name}
"She tends to lash on when she’s scared. We all do."

#speaker:Pearl
#pose:Mermaid
"Yeah. I guess it’s easier to yell at the one singing than admit you’re scared you might die soon."

-> pearl_q3_intro

=== pearl_q2_negative ===
~ Pearl_Affection -= 5

#Speaker:{Name}
"You were kind of loud though."

#speaker:Pearl
#pose:Mermaid
"Okay rude, but fair. I was really feeling the kelp shanty, alright?

-> pearl_q3_intro

=== pearl_q3_intro ===

#Speaker:{Name}
We sit in silence for awhile. Then all of a sudden mystical pearls engulf her and she's back to the usual, fully human pearl.

#Speaker:Pearl
#pose:Default
#expression:Sad
"I'm scared, Captain {Name}. This Kraken thing...it's not like the sea beasts I'm used to. It's ancient, primal and I feel like it knows we're coming."

#Speaker:Pearl
#pose:Pose2
#expression:Sad
"What...what if I freeze? What if I mess up again? Ravynn already thinks I'm a liability - but what if I actually am?"

* "You’re braver than you think."
    -> pearl_q3_comfort
* "Then don’t mess up. Simple."
    -> pearl_q3_toughlove
* "We all mess up. You’re not alone."
    -> pearl_q3_shared
    
=== pearl_q3_comfort ===

~ Pearl_Affection += 10 

#Speaker:{Name}
"You just don't see yourself the way we do."

#Speaker:Pearl
#pose:Pose2
#expression:Smile
"That's...nice to hear. I think I needed that."

#Speaker:{Name}
"You've always been enough Pearl."

#Speaker:Pearl
#pose:Pose2
#expression:Blush
"Captain {Name} you really know how to charm a lady."

-> pearl_exit

=== pearl_q3_toughlove ===
~ Pearl_Affection -=5

#Speaker:Pearl
#pose:Default
#expression:Neutral
"...Right. Thanks for the motivational speech."

#Speaker:{Name}
"It just feels like you have an existential crisis scheduled daily before lunch."

#Speaker:Pearl
#pose:Pose2
#expression:Angry
"...Thanks for the sympathy."

-> pearl_exit

=== pearl_q3_shared ===
~ Pearl_Affection += 5

#Speaker:Pearl
#pose:Default
#expression:Sad
"I know. It just feels...heavier when it's me."

#Speaker:{Name}
"And that's why we're a crew, we cover each others faults and weaknesses."

#Speaker:{Name}
"We stand together, you belong with us."

#Speaker:Pearl
#pose:Pose3
#expression:Smile
"...Thank you. I'm trying to believe that too."

-> pearl_exit

=== pearl_exit ===

#Speaker:{Name}
She takes a deep breath. Her hair shimmers under the light.

#Speaker:Pearl
#pose:Pose2
#expression:Neutral
"You seriously not freaked out, are you? About the whole half fish thing?"

#Speaker:{Name}
I shake my head and stand up.

#Speaker:{Name}
"If anything, it's...very Pearl coded."

#Speaker:Pearl
#pose:Pose2
#expression:Neutral
"That sounds like an insult disguised as a compliment."

* "It’s definitely a compliment. You’re... radiant." 
    -> pearl_exit_flirty 
* "I mean, it’s different." 
    -> pearl_exit_disinterested

=== pearl_exit_flirty ===
~ Pearl_Affection += 10
~ pearl_exit_type = "flirty"
#music_Flirty

#Speaker:Pearl
#pose:Pose3
#expression:Smile
"...You're not half bad yourself, Captain {Name}."

#Speaker:{Name}
"And you're not half bad for being a reverse mermaid."

#Speaker:Pearl
#pose:Pose2
#expression:Blush
"I could show you more sometime...these parts of me."

#Speaker:Pearl
#pose:Pose2
#expression:Smile
"The sea parts, I mean."

#Speaker:{Name}
She gives me a coy wink, and I feel the air in my throat hitch.

#Speaker:{Name}
"...Looking forward to it."

#Speaker:{Name}
Wanting to stretch this moment even longer, my eyes dart around her rom.

#Speaker:{Name}
(Oh, that's new. Let's ask about it.)

-> END

=== pearl_exit_disinterested ===
~ Pearl_Affection -= 5
~ pearl_exit_type = "disinterested"

#Speaker:Pearl
#pose:Pose2
#expression:Neutral
"Thanks for not running away screaming. That's more than most do."

#Speaker:{Name}
"Not much places to run when you sailing the sea."

#Speaker:{Name}
"Besides you're still crew."

#Speaker:Pearl
#pose:Default
#expression:Sad
"Right. Crew."

#Speaker:{Name}
She picks up a glass bead and goes to string it. The silence returns but this time it's quiet, not heavy.

#Speaker:{Name}
Trying to lighten the mood I notice she displayed new items.

#Speaker:{Name}
(Let's see if she'll talk about them.)

-> END
