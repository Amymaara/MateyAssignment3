INCLUDE Globals.ink

-> shad_stu_followup

=== shad_stu_followup ===

{ shad_exit_type == "flirty":
-> shad_stu_flirty
- else:
-> shad_stu_disinterested
}

=== shad_stu_flirty ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
The Galley’s door creaks shut behind me, but I don’t even make it halfway down the hall before feathers flutter into view.

#Speaker:Stu
#pose:Pose1
#sfx_Stu1
"Squaaak - heard pots clatter. Should I be setting a table for two or an intervention?"

#Speaker:{Name}
"Neither. Just... checked in on the Chef of Chaos. He’s fine."

#Speaker:Stu
#pose:Pose2
"Mhmm. That was a lot more than just checking up."

#Speaker:{Name}
"He showed me something. Not just food - ambition, hopes, dreams."

#Speaker:Stu
#pose:Pose1
"Ah yes. The sacred lost recipe - romance and risotto, the deadliest combo."

#Speaker:{Name}
"He’s passionate, messy - but passionate. I get why he fights so hard for flavour."

#Speaker:Stu
#pose:Pose2
"You’re falling for him, aren’t you? One meal at a time. Next thing you know, he’s feeding you components and you’re asking him to season your dreams."

#Speaker:{Name}
"He’s got guts and something deeper under all that himbo energy. It’s... enticing."

#Speaker:Stu
#pose:Pose1
"Just don’t let him flambé your heart without a fireproof vest."

#Speaker:{Name}
I smirk, but it’s true - something in me stirs when Shad talks like that. Like the heat from the oven reached something inside me.

#Speaker:{Name}
Whatever tomorrow holds, I’m glad he’s still cooking.
#sfx_DoorSounds

-> END

=== shad_stu_disinterested ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
The galley fades behind me, but the scent of overcooked ambition still lingers.

#Speaker:Stu
#pose:Pose2
#sfx_Stu2
"Squawk - you look like someone who walked through a dramatic monologue."

#Speaker:{Name}
"Shad’s got a lot going on but I’m not sure I’m the right person to simmer through it with him."

#Speaker:Stu
#pose:Pose1
"He’s loud, yeah but sometimes loud people are just trying to drown out their own silence."

#Speaker:{Name}
"I know. And I admire the dream, the... effort. But it felt like he was cooking for something that isn't here anymore, like he's chasing ghosts."

#Speaker:Stu
#pose:Pose2
"Aren’t we all? Just... be gentle with him. He’s the kind of soul that burns easy if left unattended."

#Speaker:{Name}
"I didn’t mean to shut him down. I just...didn’t know what to say."

#Speaker:Stu
#pose:Pose1
"Sometimes silence says plenty - just don’t let it be the only thing he hears."

#Speaker:{Name}
The hallway settles around us. I walk on, the weight of my silence following me.

#sfx_DoorSounds

-> END