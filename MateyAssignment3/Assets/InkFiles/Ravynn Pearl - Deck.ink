INCLUDE Globals.ink

-> conflict_ravynn_pearl

=== conflict_ravynn_pearl ===
#music_StuMusic

#Speaker:{Name}
The deck is tense today, not the usual tense from Ravynn's menancing aura. No, this was something else.  Quietness hangs in the air like it's holding its breath.

#Speaker:{Name}
This was a complete 180 from the shouting that spurred me into action, honestly - I think this might be worse.

#Speaker:{Name}
Pearl is humming a tune, off key and very loudly.

#Speaker:{Name}
She's perched near the railing strining together sea glass like oblivious that the deck is teetering on the edge of chaos.

#Speaker:Ravynn
#pose:Default
#expression:Neutral
"Pearl."

#Speaker:{Name}
I turn to find Ravynn not far off, crouching near one of the cargo creates with a notebook in hand, eyes twitching with every high pitched note.

#Speaker:Ravynn
#pose:Pose2
#expression:Neutral
"I'm trying to count rations. Your noise is...unhelpful."

#Speaker:{Name}
Pearl looks suprised, as if the thought never occured to her.

#Speaker:Pearl
#pose:Pose3
#expression:Angry
"Oh! I didn't realise you were so sensitive to art, Ravynn."

#Speaker:Ravynn
#pose:Pose3
#expression:Neutral
"That wasn't art. That was auditory war crimes."

#Speaker:{Name}
Pearl stands up, crossing her arms in disbelief. 

#Speaker:Pearl
#pose:Pose2
#expression:Angry
"And what do you know about art? The sea sings to me all the time, I'm just joining in."

#Speaker:Ravynn
#pose:Pose2
#expression:Neutral
"The sea doesn't need your help."

#Speaker:{Name}
They're both on edge, this tension isn't just about singing.

#Speaker:Ravynn
#pose:Pose3
#expression:Neutral
"And you're being reckless. Again."

#Speaker:Pearl
#pose:Default
#expression:Angry
"It's not reckless to find joy in something. Gods, we're about to face a MONSTER, Ravynn. It might be the lsat one we ever face, and you want silence?"

#Speaker:Ravynn
#pose:Pose2
#expression:Neutral
"Yes. I want focus. I want everyone to be prepared, not distracted by theatrical tunes."

#Speaker:Pearl
#pose:Pose2
#expression:Angry
"And I want to feel human for five more minutes before possibly having to watch someone die."

#Speaker:{Name}
Her words hit harder than expected, for a secon everything is still.

#Speaker:{Name} 
Ravynn replies in a low tone.

#Speaker:Ravynn
#pose:Default
#expression:Neutral
"I've watched entire crews drown because someone wasn't focused. So forgive me if I don't find your jingles comforting."

#Speaker:Pearl
#pose:Pose3
#expression:Angry
"And forgive me if I don't want to rot in fear before it even happens."

#Speaker:{Name}
Neither of them back down, but something cracks beneath the surface. Pearl's song fades and Ravynn's grip tighten around the ledger.

* "Pearl, she’s right. We need to stay sharp."
    -> side_with_ravynn
* "Ravynn, let her feel something. We can’t all survive like machines."
    -> side_with_pearl
* "You’re both right — but not helping."
    -> neutral_mediator
    
=== side_with_ravynn ===
~ Pearl_Affection -= 10
~ Ravynn_Affection += 10

#Speaker:{Name}
"We're on the edge of something big, and we can't afford distractions right now."

#Speaker:Pearl
#pose:Default
#expression:Neutral
"...Right."

#Speaker:Pearl
#pose:Pose3
#expression:Sad
"I guess singing doesn’t matter when you’re not sure if your lungs will still work tomorrow."

#Speaker:{Name}
"That's not what I meant -"

#Speaker:Pearl
#pose:Pose2
#expression:Angry
"It never is."

#Speaker:{Name}
She picks up her string of seaglass and walks away without another word.

#Speaker:Ravynn
#pose:Default
#expression:Smile
"...Thank you."

-> deck_choose

=== side_with_pearl ===
~ Ravynn_Affection -= 10
~ Pearl_Affection += 10

#Speaker:{Name}
"Ravynn, let her feel something. Not all of us cope by shutting everything out."

#Speaker:Pearl
#pose:Pose2
#expression:Smile
"Thank you, all I want is for us to have some semblance of normalcy and peace."

#Speaker:Ravynn
#pose:Default
#expression:Neutral
"I’m not asking for a concert — just basic discipline and accomadation."

#Speaker:Pearl
#pose:Pose2
#expression:Angry
"Forget it. I shouldn’t have tried to lighten the mood. Won’t happen again."

#Speaker:{Name}
"Pearl—"

#Speaker:Pearl
#pose:Default
#expression:Sad
"No, it’s fine. Apparently the only way to prepare for death is to be miserable first."

#Speaker:{Name}
Pearl storms off with her sea glass still clutched in hand.

#Speaker:Ravynn
#pose:Pose3
#expression:Neutral
"...You didn’t have to coddle her."

-> deck_choose

=== neutral_mediator ===
~ Ravynn_Affection += 5
~ Pearl_Affection += 5

#Speaker:{Name}
"Fighting isn't the way we handle things, we're pirates not barbarians."

#Speaker:{Name}
"Pearl, maybe give her a minute to finish the count. Ravynn, maybe a little music isn’t the end of the world."

#Speaker:Pearl
#pose:Pose2
#expression:Neutral
"Fine. I’ll go... be distracting elsewhere."

#Speaker:{Name}
Pearl gathers her seagless, she's not happy but not beaten down either.

#Speaker:Ravynn
#pose:Pose3
#expression:Neutral
"One day, your kindness will get you killed."

#Speaker:{Name}
"One day, your rigidity might do the same."

#Speaker:{Name}
Pearl gives one last look back, then quietly leaves.

-> deck_choose

=== deck_choose ===

#Speaker:{Name}
Ravynn returns to her ledger, quieter now.

#Speaker:{Name}
(Who should I go talk to?)

-> END
