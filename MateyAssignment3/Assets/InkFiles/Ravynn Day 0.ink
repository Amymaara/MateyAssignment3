INCLUDE Globals.ink

-> ravynn_visit

=== ravynn_visit ===
#music_RavynnMusic

#speaker:Stu
"Let’s meet Ravynn. She got the most potential out of all the recruits. I bet my tail feathers she’ll be the real deal."

#speaker:{Name}
I step onto the stern deck. The air feels rigid — maybe it’s the salt or maybe it’s the sheer pressure from someone who looks like they coordinate stress.

#speaker:{Name}
Every rope is perfectly coiled, every crate sealed and stacked like a warehouse.  

#speaker:{Name}
And yeah, there she is — sitting cross-legged, sharpening a harpoon like it personally insulted her.

#speaker:Ravynn
#pose:Default
#expression:Neutral
"Captain."

#speaker:Ravynn
#pose:Pose2
#expression:Neutral
"I was wondering when you’d get up. You’re late — I already inspected the mast, adjusted the sails, and fixed three structural flaws in the hull."

#speaker:{Name}
(Hmm...)

* "Are you always this intense?" 
    -> ravynn_intro_intense
* "Already fixing the ship? I like the initiative." 
    -> ravynn_intro_approve
* "You could’ve waited for my orders." 
    -> ravynn_intro_direct

=== ravynn_intro_intense ===
~ Ravynn_Affection -= 5

#speaker:Ravynn
#pose:Default
#expression:Neutral
"Intensity keeps people alive. Comfort and sleeping in don’t."

-> ravynn_continues

=== ravynn_intro_approve ===
~ Ravynn_Affection += 10

#speaker:Ravynn
#pose:Default
#expression:Smile
"Initiative isn’t optional when lives are on the line."

-> ravynn_continues

=== ravynn_intro_direct ===
~ Ravynn_Affection += 5

#speaker:Ravynn
#pose:Pose3
#expression:Neutral
"The sea doesn’t wait and neither do I."

-> ravynn_continues

=== ravynn_continues ===

#speaker:Ravynn
#pose:Default
#expression:Neutral
"I’m Ravynn — strategist, realist, and problem solver. I don’t believe in chance or luck. I believe in plans, strategies, contingencies."

#speaker:{Name}
(Ravynn gestures toward a perfectly arranged supply storage. They're labelled, stacked, and possibly blessed. Or cursed. Hard to tell.)

#speaker:Ravynn
#pose:Pose2
#expression:Neutral
"And you? What kind of Captain are you?"

* "I lead by example. I get my hands dirty."
    -> ravynn_style_lead
* "I delegate. That’s what having a crew is for."
    -> ravynn_style_delegate
* "I go with my gut."
    -> ravynn_style_gut

=== ravynn_style_lead ===
~ Ravynn_Affection += 10

#speaker:Ravynn
#pose:Default
#expression:Smile
"Good."

-> ravynn_philosophy

=== ravynn_style_delegate ===
~ Ravynn_Affection += 5

#speaker:{Name}
(Ravynn glances — disappointed — at a rope coil.)

#speaker:Ravynn
#pose:Pose3
#expression:Neutral
"Delegation only works if the crew isn’t made of idiots."

-> ravynn_philosophy

=== ravynn_style_gut ===
~ Ravynn_Affection -= 5

#speaker:{Name}
(She exhales, looking as if I offended logic itself.)

#speaker:Ravynn
#pose:Default
#expression:Neutral
"Guts spill. Plans don’t."

-> ravynn_philosophy

=== ravynn_philosophy ===

#speaker:{Name}
"I understand your mindset, but part of the sea’s beauty is its unpredictability. The unknown and wild raw emotion of it — sometimes riding along with the waves is all you can do."

#speaker:Ravynn
#pose:Pose3
#expression:Neutral
"Not for me. Structure is everything. The moment you surrender control is when chaos takes everything."

#speaker:Ravynn
#pose:Default
#expression:Neutral
"I’ll keep things running. But if anyone steps out of line? I’ll know — and deal with it my own way."

#speaker:Ravynn
#pose:Pose2
#expression:Neutral
"Enjoy the calm while it lasts, Captain. Life and the seas are never always serene."

#speaker:{Name}
(Oh? How should I reply to that?)

* "You're intense. Really intense. There’s something about it... it's solid. Reliable."
    -> ravynn_flirt
* "Right, right — we get it. You’ve got the ship handled. Just make sure your grip doesn’t end up breaking the crew."
    -> ravynn_dismiss

=== ravynn_flirt ===
~ Ravynn_Affection += 10
~ ravynn_exit_type = "flirty"
#music_Flirt

#speaker:Ravynn
#pose:Default
#expression:Blush
"Reliability is the foundation of survival. If that’s what impresses you — good."

#speaker:{Name}
"Impress? I didn’t say that."

#speaker:Ravynn
#pose:Default
#expression:Smile
"You were thinking it though."

#Speaker:{Name}
(She returns to sharpening her harpoon, but I catch the faintest smile.)

#speaker:{Name}
As I'm about to leave I catch a glance of one of her belongings.

#speaker:{Name}
(Let's try asking her about it)
-> END

=== ravynn_dismiss ===
~ Ravynn_Affection -= 5
~ ravynn_exit_type = "disinterested"

#speaker:Ravynn
#pose:Default
#expression:Neutral
"If they can’t handle it, they shouldn’t be out here."

#speaker:{Name}
"Not everyone is built like steel, Ravynn."

#speaker:Ravynn
#pose:Pose2
#expression:Neutral
"Then they’ll break. But I won’t."

#Speaker:{Name}
Sensing the tension my gaze shifts awkwardly until it lands upon an item.

#speaker:{Name}
(Let's try to change the topic and ask about this)
-> END