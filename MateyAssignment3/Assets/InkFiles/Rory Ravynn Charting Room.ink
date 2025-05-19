INCLUDE Globals.ink

-> charting_room
=== charting_room ===
#speaker: {Name}
The charting room is a disaster - not in the way the Galley is no. This disaster is split right down the middle of the room.

On the left, Master Porthole sat on a chair, telescope in hand. 

His surrounding? neatly rolled maps tied with silk ribbons - one of them even has his initials etched into the corner. 

This, accompanied by a quill resting at an angle ready to sign a decree. This entire side of the rooms feels like it's about to offer me  tea and gossip.

On the right? Ravynn.

Her side of the room could perform emergency surgery if needed. Wind charts nailed to the wall, precision tools and charting supplies aligned in military formation.

Everything smells like salt, leather and pending death. If a single speck of dust were to land on any of her belongings, it would defintely be sentenced to death.

The middle? A map - torn, smudged ad the topic of a very aggressive...debate?

#Speaker:Ravynn
" The wind has shifted, if we stay on your course we'll drift into stillwater by sunrise."

#Speaker:{Name}
He sips his tea before replying to her.

#Speaker:Master Porthole
"And if we follow your direction, this ship will crawl along the current like a wounded snail. The stars offer direction. The wind? mood swings at best."

#Speaker:Ravynn
'I'd rather bet on mood swings than astrology and flair.

#Speaker:Master Porthole
"My flair happens to be historically accurate."

#Speaker:{Name}
(I should've stayed in bed.)

Ravynn points to the map with irritation.

#Speaker:Ravynn
"Storm is due north, this crew cannot afford another close call."

#Speaker:Master Porthole
"This crew can't afford to die of boredom either. This isn't a prison ship - it's an expedition for God's sake."

#Speaker:{Name}
They both turn to me as if i'm some oracle. I glance at the compass, it's just as lost as I am.

* [North Star's Word]
-> side_with_rory
*[Winds don't lie]
-> side_with_ravynn
*[Compromise]
-> compromise 

=== side_with_rory ===
~Rory_Affection += 10
~Ravynn_Affection -= 10

#Speaker:{Name}
"We'll use the stars. Your route keeps us moving, an fast."

Master porthole preens as if I handed him an expensive jewel.

#Speaker:Master Porthole
"Looks like someone does have taste, welcome to the celestial fold Captain {Name}."

#Speaker:{Name}
Ravynn snaps a map tube shut as if it just offended her whole lineage.

#Speaker:Ravynn
"Remind me to prepare extra lifeboats."

#Speaker:{Name}
She walks out, her tension trailing behind her.
Master Porthole leans towards me to say something 

#Speaker:Master Porthole
"Smart and loyal. You're going to be the death of me - or someone else."

#Speaker:{Name}
He proudly prances out since he achieved what he wanted.

-> follow

=== side_with_ravynn ===
~ Ravynn_Affection += 10
~ Rory_Affection -= 10

#Speaker:{Name}
"We follow the wind, it's our safest shot."

Ravynn nods once at me, I feel like a kid finally getting their unimpressed parents approval.

(Sigh, I need to work on my mommy issues.)

#Speaker:Ravynn
"Understood."

#Speaker:{Name}
Ravynn leaves to confirm the winds direction and gather information about the sea's currents.

Master Porthole rises slowly and theatrically from his chair.

#Speaker:Master Porthole
"Very well, lead us into the gale. I'll keep my telescope polished for your apology."

#Speaker:{Name}
He leavves in a flourish, like he's storming off a theatre stage- only he's less sad and more dramatic.

-> follow

=== compromise ===
~ Rory_Affection += 5
~ Ravynn_Affection += 5

#Speaker:{Name}

I decide the best choice for my mental state is to play mediatior.

"We'll combine both methods. We use the winds to guide us short term and the stars for longer trajectories."

Both of them seem sort of stunned, not at my suggestion but rather that they weren't able to come to that conclusion themselves.

#Speaker:Master Porthole
"...I don't love it."

#Speaker:Ravynn
"I don't hate it."

#Speaker:{Name}
"Perfect! You're both equally displeased - i've achieved what I wanted."

I stare at them as they part like rival military generals after a ceasefire announcement was made.

-> follow

=== follow ===
Who should I follow?

-> END

