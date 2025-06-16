INCLUDE Globals.ink

-> stu_type
==== stu_type ===
{ pearl_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}
=== stu_flirty ===
#music_StuMusic2

#speaker:Stu
#pose:Pose1
"Squaaak — what in the seven seas just happened?"

#speaker:{Name}
"I think I broke her… by flirting."

#speaker:Stu
#pose:Pose2
"Remind me to keep you away from the emotional ones, you heartthrob."

#speaker:{Name}
"Too late. I think she tried to flirt back with that seashell."

#speaker:{Name}
We stare at the door for a second, then decide to keep walking away, fast.

-> END

 === stu_disinterested ===
#music_StuMusic2

#speaker:Stu
#pose:Pose2
"She seems a bit frazzled, Captain {Name}. Let’s give her some space to, uh… organise her socks?"

#speaker:{Name}
"Yeah, agreed. Let’s get out of here."

#speaker:{Name}
I left Pearl's room. She hums and tosses things about.  

#speaker:{Name}
I wonder why she got so worked up over what I said?

-> END