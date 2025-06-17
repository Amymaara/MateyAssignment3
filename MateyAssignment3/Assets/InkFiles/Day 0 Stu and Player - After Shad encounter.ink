INCLUDE Globals.ink

-> stu_type
=== stu_type ===
{ shad_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}

==== stu_flirty ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
I leave and he waves me off, spatula in hand.  
  
#Speaker:{Name}
Behind him, a chicken hops onto the counter and pecks at the pie — neither of them look alarmed.

#speaker:Stu
#pose:Pose2
#sfx_Stu1
"Squaaak - did he just try flirting back with a cooking pun?"

#speaker:{Name}
"I think he tried. Or maybe the fumes were getting to him."

 #Speaker:{Name}
 I look back one more time. He’s whispering words of encouragement to the pot and I don’t have the heart to interrupt him for clarification.
 
#sfx_DoorSounds

-> END

=== stu_disinterested ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
He gives me a thumbs up, and I walk out before something stares at me with contempt again.

#speaker:Stu
#pose:Pose1
#sfx_Stu2
"Squaaak — I’m sure he means well… but he’s like a tsunami with an apron."

#speaker:{Name}
"I’d rather my chances with Hades than those meals."

#speaker:Stu
#pose:Pose2
"Yet… he’s kind of lovable?"

#speaker:{Name}
"Maybe. But if he ever calls something mildly sentient again, I’m jumping ship."

#speaker:{Name}
As I leave, I hear Shad joyfully say: "Yay! It’s bubbling again!" Followed by a soft boom. 

#speaker:{Name}
I choose peace. 

#speaker:{Name}
And distance.
#sfx_DoorSounds

-> END