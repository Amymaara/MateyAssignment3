INCLUDE Globals.ink

-> shad_pearl_octopus_scene

=== shad_pearl_octopus_scene ===
#music_Celtic-moon-loop-1-284914
#Speaker:{Name}
The Mess Hall is in chaos. Again.

Flour is sprinkled everywhere like a snowstorm just hit. Something is boiling that probably shouldn’t be, and in the middle of the culinary apocalypse — Pearl and Shad are arguing. Loudly.

#Speaker:Shad
#pose:Pose3
#expression:Angry
"I’m telling you, Pearl, that slimy thief reached right in and took my whisk — right off my hand! My favourite one — Mr Whisk!"

#Speaker:Pearl
#pose:Default
#expression:Angry
"Well, maybe it was just curious? It’s an octopus — they’re intelligent and fundamentally misunderstood."

#speaker:Shad
#pose:Pose2
#expression:Angry
"That whisk is a relic to me! It’s seasoned with memories, and that 8-legged calamari is going in the pot to make up for it!"

#speaker:Pearl
#pose:Pose2
#expression:Angry
"Absolutely NOT. You cannot and will not cook something just because it stole a kitchen tool!"

#speaker:Shad
#pose:Default
#expression:Angry
"It’s NOT just a tool! It’s Mr Whisk!"

#speaker:{Name}
I step in just in time to see Pearl standing protectively in front of an octopus, shielding it like some kind of sea creature guardian.  
Shad is wielding a skillet like it’s the blade of justice.

#speaker:Pearl
#pose:Default
#expression:neutral
"We can lure it away or offer it a trade! I can negotiate!"

#speaker:Shad
#pose:Default
#expression:Angry
"It’s an octopus, Pearl."

#speaker:Pearl
#pose:Pose2
#expression:Angry
"I’m very persuasive!"

* [Peace Talks] 
    -> whisk_peace
* [Justice Served] 
    -> whisk_cook
* [Neutral Strategy]
    -> whisk_trap

=== whisk_peace ===
~ Pearl_Affection += 10
~ Shad_Affection -= 10

#speaker:{Name}
"Let’s try and get it back peacefully — no need to escalate into seafood warfare."

#speaker:Pearl
#pose:Pose3
#expression:Blush 
"See! The Captain gets it. We’re not barbarians."

#speaker:Shad
#pose:Pose2
#expression:Angry
"Speak for yourself..."

#Speaeker:{Name}
(He lowers the pan... but not happily.)

-> whisk_aftermath

=== whisk_cook ===
~ Pearl_Affection -= 10
~ Shad_Affection += 10

#speaker:{Name}
"You mess with a man’s whisk and you might as well sign your marinade papers — let’s get the pan."

#speaker:Shad
#pose:Default
#expression:Blush
"Thank you! Finally, someone who respects the sanctity of Mr Whisk."

#speaker:Pearl
#pose:Pose2
#expression:Sad
"You..you’d cook Sardinella next, wouldn’t you?!"

-> whisk_aftermath

=== whisk_trap ===
~ Pearl_Affection += 5
~ Shad_Affection += 5

#speaker:{Name}
"Or, hear me out — we trap it using a decoy whisk and anchovies."

(Both of them blink blankly.)

#speaker:Pearl
#pose:Pose2
#expression:Neutral
"That’s… actually not a terrible idea."

#speaker:Shad
#pose:Pose2
#expression:Neutral
"Yeah. That might have been the most pirate thing you’ve said yet."

-> whisk_aftermath

=== whisk_aftermath ===

#speaker:{Name}
Eventually their tempers settle.  

Pearl storms off to her room to collect some “diplomatic” sea tools.  
Shad heads to the Galley and starts dramatically flipping pancakes while mumbling about dishonourable molluscs.

(Who should I follow?)

-> END

