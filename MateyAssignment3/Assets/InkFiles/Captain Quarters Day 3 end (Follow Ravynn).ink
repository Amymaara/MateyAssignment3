INCLUDE Globals.ink

-> stu_ravynn_path

=== stu_ravynn_path ===
{ ravynn_exit_type == "flirty":
    -> ravynn_follow_stu_soft
- else:
    -> ravynn_follow_stu_cold
}

=== ravynn_follow_stu_soft ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
The deck is calmer now. Ravynn's voice lingers in my head - half a threat, half a promise.

#Speaker:{Name}
I'm halfway to the stairs when I hear the sound of feathers and attitude swooping down.

#Speaker:Stu
#pose:Pose1
#sfx_Stu1
"Squaaak - I leave you alone for one ration check and suddenly you're in fanfiction."

#Speaker:{Name}
"You heard that?"

#Speaker:Stu
#pose:Pose2
"I hear everything. Also, she said 'your quarters' - so I'm worried about your safety."

#Speaker:{Name}
I snort, unable to help the grin tugging at my mouth.

#Speaker:{Name}
"She's got layers."

#Speaker:Stu
#pose:Pose1
"Yeah? Like an onion? Just with better eyeliner and a secret author identity?"

#Speaker:{Name}
"Shut up. You think she'd let me read her stories?"

#Speaker:Stu
#pose:Pose2
"Captain {Name}, If she lets you survive after hearing about this, you're halfway to marriage."

#Speaker:{Name}
We look at each other and burst into laughter. The wind picks up a bit, less of a storm and more of a breeze.

#Speaker:Stu
#pose:Pose1
"But hey...she trusts you. That means something. Don’t mess it up, unless you want to be the villain in her next story - 'No Love on Deck: The Captain Dies in Every Ending'."
#sfx_DoorSounds


-> END

=== ravynn_follow_stu_cold ===
#music_StuMusic2
#sfx_DoorSounds
#sfx_HallwayWalk

#Speaker:{Name}
I walk away, Ravynn's words still clinging like the sea spray to my mind."

#Speaker:{Name}
Stu glides down from the mast and lands beside me. No sass, no squawk - he too is silent.

#Speaker:Stu
#pose:Pose1
"...You know, she was trying."

#Speaker:{Name}
"I didn't bite. I just...wasn't ready for that."

#Speaker:Stu
#pose:Pose1
"It doesn't matter what you were ready for. Some people only unwrap their past in front of people they trust."

#Speaker:Stu
#pose:Pose2
"And you trampled on it, like it was a piece of barnacle-infested driftwood."

#Speaker:{Name}
I stare out at the sea. It suddenly looks a lot wider and quieter than before.

#Speaker:{Name}
"I didn't mean to hurt her."

#Speaker:Stu
#pose:Pose1
"Meaning doesn't change the bruises it leaves. You can patch up the sail, but the tear still happened."

#Speaker:{Name}
"Do you always speak in metaphors?"

#Speaker:Stu
#pose:Pose2
"I speak facts."

#Speaker:{Name}
The ship creaks as it sways forward. For the first time in a while, I don't feel like I'm worthy of the title Captain.
#sfx_DoorSounds


-> END