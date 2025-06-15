INCLUDE Globals.ink

-> stu_type

=== stu_type ===

{ ravynn_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}

=== stu_flirty ===
#music_Medieval-star-188280

#speaker:Stu
#pose:Pose1
"Squaaak - was that flirting or an interrogation?"

#speaker:{Name}
"A little bit of both. Not sure who won."

#speaker:Stu
#pose:Pose2
"Definitely her. You like the scary ones, don’t you?"

#speaker:{Name}
I glance back. She’s already reorganising the ropes. I walk away. Respectfully.

-> END

=== stu_disinterested ===
#music_Medieval-star-188280

#Speaker:{Name}
I turn and walk back. She doesn’t look back — and neither do I.

#speaker:Stu
#pose:Pose2
"Squaaak - she’s not just intense. She’s ferocious."

#speaker:{Name}
"Yeah. And if she ever snaps, we’ll all be going overboard... in alphabetical order, probably."

#speaker:{Name}
I look back one more time - she’s still sharpening that harpoon.  

#speaker:{Name}
I realise my hand is gripping the hem of my sleeve.

-> END