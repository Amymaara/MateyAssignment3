INCLUDE Globals.ink

-> rory_stu_followup

=== rory_stu_followup ===

{ rory_exit_type == "flirty":
-> rory_stu_flirty
- else:
-> rory_stu_disinterested
}

=== rory_stu_flirty ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
As I step out of the study, the air still thick with revelations and royalty, Stu glides down and lands beside me.

#Speaker:Stu
#pose:Pose1
#sfx_Stu1
"Squaaawk - sooo... you're into crown trauma now?"

#Speaker:{Name}
"Don’t start."

#Speaker:Stu
#pose:Pose2
"Can’t help myself. You just found out he’s a runaway prince with authority issues and you still flirted."

#Speaker:{Name}
"I wasn’t flirting. I was... emotionally supporting."

#Speaker:Stu
#pose:Pose1
"Captain, you practically proposed with your eyebrows."

#Speaker:{Name}
"...Maybe I have a type."

#Speaker:Stu
#pose:Pose2
"A royal with commitment issues and a superiority complex?"

#Speaker:{Name}
"I said what I said."

#Speaker:Stu
#pose:Pose1
"Just make sure you're not his next political conquest. Royals are great at declarations... not always at staying."

#Speaker:{Name}
"I know. But for a moment back there - it felt like he meant it, every word."

#Speaker:Stu
#pose:Pose2
"Then hold onto that. Just...maybe keep a dagger under your pillow, just in case."
#sfx_DoorSounds

-> END

=== rory_stu_disinterested ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
I step out of the study, the door clicking softly behind me. Stu lands beside me like he’s been waiting the whole time.

#Speaker:Stu
#pose:Pose2
#sfx_Stu2
"Squaaawk - what’s the royal verdict? Still single, still snarky?"

#Speaker:{Name}
"He told me the truth. That counts for something."

#Speaker:Stu
#pose:Pose1
"And yet you looked at him like he’d just offered you a cursed tiara."

#Speaker:{Name}
"He wants to be more than his title. I want someone who already is."

#Speaker:Stu
#pose:Pose2
"Hm. Fair. But you know... even runaway royals bleed the same as everyone else."

#Speaker:{Name}
"And lie, and manipulate, and carry legacies they can’t escape."

#Speaker:Stu
#pose:Pose1
"Sounds like someone’s been burned before."

#Speaker:{Name}
"We've all got burn marks. I just choose not to fan the flames."

#Speaker:Stu
#pose:Pose2
"Deep and dramatic, you’ll make a fine tragic protagonist someday, Cap’n {Name}."

#Speaker:{Name}
"I’d prefer a happy ending, thanks."

#Speaker:Stu
#pose:Pose1
"Then stop looking for it in people who come with titles and traumas."
#sfx_DoorSounds


-> END
