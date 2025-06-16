INCLUDE Globals.ink

-> stu_shad_path
=== stu_shad_path ===
{ shad_exit_type == "flirty":
-> shad_follow_stu_soft
- else:
-> shad_follow_stu_cold
}

=== shad_follow_stu_soft ===
#music_StuMusic2

#speaker:{Name}
I smirk and step out of the galley, leaving him to wonder what my actions meant.

#speaker:{Name}
#pose:Pose1
Stu’s perched just outside the galley, poorly pretending not to have been eavesdropping.

#speaker:Stu
#pose:Pose2
"Squaaak — someone’s turning up the heat in more ways than one."

#speaker:{Name}
"He’s charming. In a reckless, flammable type of way."

#speaker:{Name}
I glance back toward the galley door where laughter and the clanging of pans still echo.

#speaker:{Name}
We keep walking. The air is cooler out here, but it still feels like something’s heating up.

-> END

=== shad_follow_stu_cold ===
#music_StuMusic2

#speaker:{Name}
I walk out before the quiet becomes even more awkward. Behind me, a metal spoon hits the floor — he doesn’t pick it up right away.

#speaker:{Name}
For a guy who always fills the room with noise, this silence feels heavier than anything he’s ever set on fire.

#speaker:{Name}
I step onto the upper deck. The air hits colder than before — or maybe I just feel colder.

#speaker:{Name}
Stu is perched on the railing, waiting for me.  

#speaker:{Name}
He doesn’t say anything at first, just judges me with those birdy eyes.

#speaker:Stu
#pose:Pose2
"Squaaak — that was… something."

#speaker:{Name}
"It was a whisk. Not a tragedy. He’ll get over it."

#speaker:{Name}
I lean against the railing, eyes roaming anywhere but the galley.

#speaker:{Name}
"I’m not here to coddle feelings."

#speaker:Stu
#pose:Pose1
"No, you’re a leader.  

#speaker:Stu
#pose:Pose1
"But leading doesn’t mean leaving your crew bleeding on the inside."

#speaker:{Name}
The wind shifts. I instinctively rub my arms.

#speaker:Stu
#pose:Pose2
"You don’t have to love the guy. But you looked him right in the eye and kicked down the only thing he’s ever opened up about."

#speaker:Stu
#pose:Pose1
"That kind of bruise doesn’t show on the surface — but it lingers."

#speaker:{Name}
I don’t respond. I grip the railing tighter and stare into the sea.  

#speaker:{Name}
The waves sound louder than they should.

-> END