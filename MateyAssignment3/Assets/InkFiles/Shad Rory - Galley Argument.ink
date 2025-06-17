INCLUDE Globals.ink

-> conflic_shad_rory

=== conflic_shad_rory ===
#music_StuMusic2

 #Speaker:{Name}
 The galley smells...complicated. There's the usual hint of sweet, spicy but an overwhelming scent of something brewing that shouldn't be.
 
 #Speaker:{Name}
 Shad is elbow deep in a pot, which is making me question the hygiene of this kitchen. I know we're pirates but it still seems...wrong.
 
 #Speaker:{Name}
 Master Porthole is standing nearby, arms crossed and eyes twitching with an increasing disdain.
 
#Speaker:Master Porthole
#pose:Default
#expression:Angry
"Tell me that isn’t...a fermented banana floating in there."

#Speaker:Shad
#pose:Pose2
#expression:Angry
"Banana and horseradish. It’s a bold pairing but I'm sure it'll help with morale!"

#Speaker:{Name}
Master Porthole visibly recoils like the contents in the pot insulted his bloodline.

#Speaker:Master Porthole
#pose:Default
#expression:Angry
"For morale? It smells like a dare gone wrong, we're not savages for godsakes!"

#Speaker:Shad
#pose:Default
#expression:Angry
"You don't need luxuries to make something delicious, your highness."

#Speaker:{Name}
(Oh no.)

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"You're feeding the crew, not pranking them. We're hours away from a monster attack and you're treating it like an experimental potluck!"

#Speaker:Shad
#pose:Pose2
#expression:Angry
"Exactly. We might die tomorrow. The crew deserves flavour."

#Speaker:{Name}
There it is, the real reason behind this clash of egos.

#Speaker:Master Porthole
#pose:Default
#expression:Angry
"What they deserve is nourishment. A balance, stabilised, edible meal. Not a gastrointestinal ticking bomb."

#Speaker:Shad
#pose:Default
#expression:Angry
"You think your fancy little charts and mannerisms can save people from fear? Sometimes a hearty meal helps a lot more than planning."

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"And sometimes planning prevents funerals."

#Speaker:{Name}
They're both worked up. Neither of them are even talking about food anymore.

* "Shad, maybe now’s not the time to play kitchen roulette."
    -> side_with_rory
* "Master Porthole, let people breathe. We need liveliness too."
    -> side_with_shad
* "Alright, food critics - how about we focus on not dying first?"
    -> neutral_mediator

=== side_with_rory ===

~ Shad_Affection -= 10 
~ Rory_Affection += 10 

#Speaker:{Name}
"We need stability right now. This isn't the time to risk turning our dinner into a catastrophe."

#Speaker:Shad
#pose:Pose2
#expression:Angry
"Oh. Got it. Back to my gruel and silence, then."

#Speaker:{Name}
"That's not what I meant-"

#Speaker:Shad
#pose:Default
#expression:Angry
"Sure, it isn't."

#Speaker:{Name}
He grabs a ladle and mutters something about me having 'joyless leadership' and storm to a cabinet.

#Speaker:Master Porthole
#pose:Pose2
#expression:Smile
"Thank you. Someone has to maintain standards around here."

#Speaker:{Name}
Master Porthole side eyes Shad's mystery dish before leaving swiftly.

-> galley_choose

=== side_with_shad ===
~ Rory_Affection -= 10 
~ Shad_Affection += 10

#Speaker:{Name}
"Loosen up a bit, people cope in different ways. Right now Shad wants to feed not just food but hope too."

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"Hope doesn't come with indigestion."

#Speaker:Shad
#pose:Default
#expression:Neutral
"Hey! I heard that. But don't worry next time I'll go easy on the squid ink in your portion."

#Speaker:Master Porthole
#pose:Default
#expression:Angry
"I-Forget it. Enjoy your culinary chaos."

#Speaker:{Name}
Master Porthole turns on his heel and leaves.

#Speaker:Shad
#pose:Pose2
#expression:Smile
"Thank you...I just wish I got to show him the shrimp dessert."

-> galley_choose

=== neutral_mediator ===
~ Rory_Affection += 5
~ Shad_Affection += 5

#Speaker:{Name}
"Look we're all stressed. Let's not turn this into a battleground too."

#Speaker:Shad
#pose:Pose2
#expression:Neutral
"Fine...I'll try this new recipe next time."

#Speaker:Master Porthole
#pose:Default
#expression:Neutral
"And I'll...refrain from arguing over questionable ingredients."

#Speaker:{Name}
"That's the spirit."

#Speaker:{Name}
They both grunt, not exactly on friendly terms just yet but not clawing at each others faces either. Master Porthole decides to leave whilst Shad starts cooking something more... familiar.

-> galley_choose

=== galley_choose ===

#Speaker:{Name}
The galley simmers with the leftover tension.

#Speaker:{Name}
(Who should I check on?)

-> END