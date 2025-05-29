INCLUDE Globals.ink

-> charting_room
=== charting_room ===
#music_Celtic-moon-loop-1-284914

#speaker: {Name}
The charting room is a disaster - not in the way the Galley is no. This disaster is split right down the middle of the room.

#speaker: {Name}
On the left, Master Porthole sat on a chair, telescope in hand. 

#speaker: {Name}
His surroundings? Neatly rolled maps tied with silk ribbons - one of them even has his initials etched into the corner. 

#speaker: {Name}
This, accompanied by a quill resting at an angle ready to sign a decree. This entire side of the room feels like it's about to offer me  tea and gossip.

#speaker: {Name}
On the right? Ravynn.

#speaker: {Name}
Her side of the room could perform emergency surgery if needed. Wind charts nailed to the wall, precision tools and charting supplies aligned in military formation.

#speaker: {Name}
Everything smells like salt, leather, and impending death. If a single speck of dust were to land on any of her belongings -"

#speaker: {Name}
"...It would definitely be sentenced to death."

#speaker: {Name}
The middle? A map - torn, smudged, and the topic of a very aggressive...debate?

#Speaker:Ravynn
#pose:Default
#expression:Angry
"The wind has shifted. If we stay on your course we'll drift into still water by sunrise."

#Speaker:{Name}
He sips his tea before replying to her.

#Speaker:Master Porthole
#pose:Default
#expression:Angry
"And if we follow your direction, this ship will crawl along the current like a wounded snail. The stars offer direction. The wind? mood swings at best."

#Speaker:Ravynn
#pose:Pose2
#expression:Angry
"I'd rather bet on mood swings than astrology and flair."

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"My flair happens to be historically accurate."

#Speaker:{Name}
(I should've stayed in bed.)

#Speaker:{Name}
Ravynn points to the map with irritation.

#Speaker:Ravynn
#pose:Pose3
#expression:Angry
"Storm is due north, this crew cannot afford another close call."

#Speaker:Master Porthole
#pose:Pose2
#expression:Angry
"This crew can't afford to die of boredom either. This isn't a prison ship - it's an expedition for God's sake."

#Speaker:{Name}
They both turn to me as if I'm some oracle. I glance at the compass, it's just as lost as I am.

#Speaker:{Name}
*["We'll use the stars. Your route keeps us moving, and fast."]
-> side_with_rory
*["We follow the wind, it's our safest shot."]
-> side_with_ravynn
*["We'll combine both methods. We use the winds to guide us short term and the stars for longer trajectories."]
-> compromise 

=== side_with_rory ===
~Rory_Affection += 10
~Ravynn_Affection -= 10

#Speaker:{Name}
"We'll use the stars. Your route keeps us moving, and fast."

#Speaker:{Name}
Master Porthole preens as if I handed him an expensive jewel.

#Speaker:Master Porthole
#pose:Pose2
#expression:Blush
"Looks like someone does have taste. Welcome to the celestial fold Captain {Name}."

#Speaker:{Name}
Ravynn snaps a map tube shut as if it just offended her whole lineage.

#Speaker:Ravynn
#pose:Pose2
#expression:Angry
"Remind me to prepare extra lifeboats."

#Speaker:{Name}
She walks out, her tension trailing behind her.

#Speaker:{Name}
Master Porthole leans towards me to say something.

#Speaker:Master Porthole
#pose:Pose3
#expression:Blush
"Smart and loyal. You're going to be the death of me - or someone else."

#Speaker:{Name}
He proudly prances out since he achieved what he wanted.

-> follow

=== side_with_ravynn ===
~ Ravynn_Affection += 10
~ Rory_Affection -= 10

#Speaker:{Name}
"We follow the wind, it's our safest shot."

#Speaker:{Name}
Ravynn nods once at me, I feel like a kid finally getting their unimpressed parents approval.

#Speaker:{Name}
(Sigh, I need to work on my mommy issues.)

#Speaker:Ravynn
#pose:Pose2
#expression:Blush
"Understood."

#Speaker:{Name}
Ravynn leaves to confirm the wind's direction and gather information about the sea's currents.

#Speaker:{Name}
Master Porthole rises slowly and theatrically from his chair.

#Speaker:Master Porthole
#pose:Default
#expression:Angry
"Very well - lead us into the gale. I'll keep my telescope polished for your apology."

#Speaker:{Name}
He leaves in a flourish, like he's storming off a theatre stage - only he's less sad and more dramatic.

-> follow

=== compromise ===
~ Rory_Affection += 5
~ Ravynn_Affection += 5

#Speaker:{Name}
I decide the best choice for my mental state is to play mediator.

#Speaker:{Name}
"We'll combine both methods. We use the winds to guide us short term and the stars for longer trajectories."

#Speaker:{Name}
Both of them seem sort of stunned, not at my suggestion but rather that they weren't able to come to that conclusion themselves.

#Speaker:Master Porthole
#pose:Default
#expression:Neutral
"...I don't love it."

#Speaker:Ravynn
#pose:Default
#expression:Neutral
"I don't hate it."

#Speaker:{Name}
"Perfect! You're both equally displeased - i've achieved what I wanted."

#Speaker:{Name}
I stare at them as they part like rival military generals after a ceasefire announcement was made.

-> follow

=== follow ===

#Speaker:{Name}
(Who should I follow?)

-> END

