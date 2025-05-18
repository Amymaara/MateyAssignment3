INCLUDE Globals.ink

-> stu_type

=== stu_type ===

{ ravynn_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}

=== stu_flirty ===

#speaker:Stu
"Squaaak — was that flirting or an interrogation?"

#speaker:{Name}
"A little bit of both. Not sure who won."

#speaker:Stu
"Definitely her. You like the scary ones, don’t you?"

(I glance back. She’s already reorganizing the ropes. I walk away. Respectfully.)

-> END

=== stu_disinterested ===

#Speaker:{Name}
(I turn and walk back. She doesn’t look back — and neither do I.)

#speaker:Stu
"Squaaak — she’s not just intense. She’s ferocious."

#speaker:{Name}
"Yeah. And if she ever snaps, we’ll all be going overboard... in alphabetical order probably."

(I look back one more time — she’s still sharpening that harpoon.  
I realize my hand is gripping the hem of my sleeve without even noticing.)

-> END