INCLUDE Globals.ink

-> stu_exit_rory
=== stu_exit_rory ===

{rory_exit_type == "flirty":
    -> rory_stu_flirty
- else:
    -> rory_stu_disinterested
}

=== rory_stu_flirty ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#speaker:{Name}
I leave the study, making sure not to look back. The door closes with a soft click, but his gaze lingers on my skin.

#speaker:{Name}
Stu is already waiting in the hallway, perched atop a lantern.

#Speaker:Stu
#pose:Pose1
#sfx_Stu1
"Squaaak - stars in his eyes and yours too, huh Cap'n {Name}?"

#Speaker:{Name}
"He's like fire wrapped in silk. 

#speaker:{Name}
Attractive, dangerous.

#speaker:{Name}
I'm like a moth drawn to a flame around him."

#Speaker:Stu
#pose:Pose2
"Fire spreads, Cap'n {Name} and he's the kind that doesn't just warm you up but consumes you whole."

#Speaker:{Name}
"I know, that's the problem."

#Speaker:Stu
#pose:Pose1
"Just make sure he doesn't write your story for you."

#Speaker:{Name}
"But what if I want to be a chapter in his book?"

#Speaker:Stu
#pose:Pose2
"Then pray you don't make a one time appearance."

#Speaker:{Name}
The maps rustle as the wind sneaks in through the cracks. For a moment I wonder if he's still watching me from behind the door.
#sfx_DoorSounds

-> END

=== rory_stu_disinterested ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
I close the door behind me with a firm tug. The study's silence follows me out.

#speaker:{Name}
Stu is perched outside, looking annoying as usual.

#Speaker:Stu
#pose:Pose2
#sfx_Stu2
"Squaak - you left him ice-cold."

#Speaker:{Name}
"He'll live."

#Speaker:Stu
#pose:Pose1
"Maybe, but I give it 2 hours before he's monologuing to the stars."

#Speaker:{Name}
"He's intense, not fragile."

#Speaker:Stu
#pose:Pose2
"Those two go hand in hand. He's both lace and poison wrapped up together."

#Speaker:{Name}
"Good thing I've got scissors and an antidote."

#speaker:{Name}
Stu tilts his head, his talons softly click on the wood.

#Speaker:Stu
#pose:Pose1
"Just be careful, he seems the type to carve not stab."

#Speaker:{Name}
The wind outside is louder now. Somehow the silence in the hallway feels like it belongs to him.
#sfx_DoorSounds


-> END