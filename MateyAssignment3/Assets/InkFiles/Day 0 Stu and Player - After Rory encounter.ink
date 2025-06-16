INCLUDE Globals.ink

-> stu_type
=== stu_type ===
{ rory_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}

=== stu_flirty ===
#music_StuMusic2

 #Speaker:{Name}
I turn around to leave, and I swear — solemnly swear — that I heard him say: "You’re welcome."

#speaker:Stu
#pose:Pose1
"Squaaak, was that flirting or a verbal skirmish?"

#speaker:{Name}
"A little bit of both, I think? He complimented me with his eyes but insulted me with his tone."

#speaker:Stu
#pose:Pose2
"High society courting terrifies me."

#speaker:{Name}
I glance back one last time. He’s already adjusting and aligning new pieces of furniture. 

#speaker:{Name}
I’m not sure if I want to kiss him or throw him overboard.

-> END
 === stu_disinterested ===
#music_StuMusic2
 
 #Speaker:{Name}
I'm out before I associate that nauseating perfume with his ego. 

#speaker:{Name}
Nope. Already done.

#speaker:Stu
#pose:Pose2
"You two get along as well as pirates and piranhas."

#speaker:{Name}
"Let’s just hope he’s better with a map than he is with decor."

#speaker:{Name}
I glance back at the room. He didn’t follow, but I’m 97% sure he’s scheming something to spite me. 

#speaker:{Name}
I’ve survived worse — like tentacles and emotional vulnerability.

-> END