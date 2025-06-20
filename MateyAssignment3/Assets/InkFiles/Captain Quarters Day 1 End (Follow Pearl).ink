INCLUDE Globals.ink

-> stu_pearl_path
=== stu_pearl_path ===
{ pearl_exit_type == "flirty":
-> pearl_follow_stu_soft
- else:
-> pearl_follow_stu_cold
}

=== pearl_follow_stu_soft ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk
#speaker:{Name}
I exit her room, and Stu flutters down to land on my shoulder, beak tilted like he knows exactly what I’ve done.

#speaker:Stu
#pose:Pose1
#sfx_Stu1
"Squaaak — someone’s got a type."

#speaker:{Name}
"Shut up."

#speaker:Stu
#pose:Pose2
"Sparkly, sings to fish, blushes when you flirt — it’s practically a siren’s résumé."

#speaker:{Name}
"She’s got a good heart. Even if it’s wrapped in emotional support glitter."

#speaker:Stu
#pose:Pose1
"Well, at least she hasn’t tried to hex you yet. This is already going better than your last endeavours."

#speaker:{Name}
I glance at the water. The stars are starting to show. Somehow, things feel a little more peaceful tonight.
#sfx_DoorSounds
-> END

=== pearl_follow_stu_cold ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#speaker:{Name}
I walk away. The ocean keeps moving — and so do we.

#speaker:{Name}
Stu lands beside me. His talons clink softly on the railing.

#speaker:Stu
#pose:Pose2
#sfx_Stu2
"Squaaak — that sure went well."

#speaker:{Name}
"I wasn’t in the mood for whimsy tonight, especially not sea metaphors."

#speaker:Stu
#pose:Pose1
"She’s not just metaphors, you know. That girl’s got more heart than half this crew put together."

#speaker:{Name}
"Yeah, well... that gets people killed."

#speaker:Stu
#pose:Pose2
"So does being cold. Let’s hope yours doesn’t freeze over before we reach our destination."

#speaker:{Name}
I don’t answer. The waves crash against the ship. Tonight, they feel louder than they should.
#sfx_DoorSounds
-> END