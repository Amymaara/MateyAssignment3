INCLUDE Globals.ink

-> stu_exit_ravynn
=== stu_exit_ravynn===

{ravynn_exit_type == "flirty":
    -> stu_flirty
- else:
    -> stu_disinterested
}

=== stu_flirty ===
#music_StuMusic2

#Speaker:{Name}
I step off the deck, still feeling the tension on my skin.

#Speaker:{Name}
Stu flutters down. pretending like he didn't just watch the whole thing.

#Speaker:Stu
#pose:Pose2
"Squaak - are you trying to seduce the ship's armoury?"

#Speaker:{Name}
"She flirted back...I think."

#Speaker:{Name}
"Or maybe she threatened to set me on fire? Honestly, I'm not sure."

#Speaker:Stu
#pose:Pose1
"You've got a death wish Cap'n {Name}, and apparently a type, an intense, terrifying type."

#Speaker:{Name}
"She's sharp, focused - she makes me want to be a better Captain."

#Speaker:Stu
#pose:Pose2
"Are you cream? Because you're whipped. Just make sure if she kisses you, it isn't followed by stabbing."

#Speaker:{Name}
"No promises."

#Speaker:{Name}
Stu whistles as he flutters by my side. The deck is quiet again, yet I can feel her lingering stare.

#Speaker:{Name}
The wind picks up, the ship never gives you calm after a storm.
-> END

=== stu_disinterested ===
#music_StuMusic2

#Speaker:{Name}
I step away from the deck, she didn't watch me go and I didn't look back.

#Speaker:{Name}
Some people build walls to protect others, Ravynn builds them to make sure no one tries.

#Speaker:{Name}
Stu lands beside me.

#Speaker:Stu
#pose:Pose1
"Squaak - well she's frostier than an iceberg."

#Speaker:{Name}
"She wanted solitude, I gave it to her."

#Speaker:Stu
#pose:Pose2
"You sure that's all she wanted?"

#Speaker:{Name}
"I'm not here to get people to open up, Stu. If she wants to be a fortress, she can."

#Speaker:Stu
#pose:Pose1
"Yeah, but even fortresses fall."

#Speaker:{Name}
"I'm a Captain, not a therapist."

#Speaker:{Name}
Stu's quiet for once, just watching the sea with me. It's just like her, unpredictable and unforgiving.

#Speaker:Stu
#pose:Pose2
"Just don't forget, Cap'n {Name}...even strong ships need care. Otherwise they sink and take everyone with them."

#Speaker:{Name}
 I don't reply - I just grip the railing tigher."
 
 #Speaker:{Name}
 "Because he's right, and because I'm tired of things sinking."
-> END