INCLUDE Globals.ink

-> ravynn_visit

=== ravynn_visit ===

#speaker:Stu
"Let’s meet Ravynn. She got the most potential out of all the recruits. I bet my tail feathers she’ll be the real deal."

#speaker:{Name}
I step onto the stern deck. The air feels rigid — maybe it’s the salt or maybe it’s the sheer pressure from someone who looks like they coordinate stress.

Every rope is perfectly coiled and every crate sealed and stacked like a warehouse.  
And yeah, there she is — sitting cross-legged, sharpening the harpoon like it personally insulted her.

#speaker:Ravynn
"Captain."

#speaker:Ravynn
"I was wondering when you’d get up. You’re late — I already inspected the mast, adjusted the sails, and fixed three structural flaws in the hull."

* [Discipline] 
    -> ravynn_intro_intense
* [Approval] 
    -> ravynn_intro_approve
* [Chain of Command] 
    -> ravynn_intro_direct

=== ravynn_intro_intense ===
~ Ravynn_Affection -= 10

#speaker:{Name}
"Are you always this intense?"

#speaker:Ravynn
"Intensity keeps people alive. Comfort and sleeping in don’t."

-> ravynn_continues

=== ravynn_intro_approve ===
~ Ravynn_Affection += 10

#speaker:{Name}
"Already fixing the ship? I like the initiative."

#speaker:Ravynn
"Initiative isn’t optional when lives are on the line."

-> ravynn_continues

=== ravynn_intro_direct ===
~ Ravynn_Affection += 0

#speaker:{Name}
"You could’ve waited for my orders."

#speaker:Ravynn
"The sea doesn’t wait and neither do I."

-> ravynn_continues

=== ravynn_continues ===

#speaker:Ravynn
"I’m Ravynn — strategist, realist, and problem solver. I don’t believe in chance or luck. I believe in plans, strategies, contingencies."

(Ravynn gestures toward a perfectly arranged supply storage. They're labelled, stacked, and possibly blessed. Or cursed. Hard to tell.)

#speaker:Ravynn
"And you? What kind of Captain are you?"

* [Hands-on]
    -> ravynn_style_lead
* [Delegator] 
    -> ravynn_style_delegate
* [Instinct]
    -> ravynn_style_gut

=== ravynn_style_lead ===
~ Ravynn_Affection += 10

#speaker:{Name}
"I lead by example. I get my hands dirty."

#speaker:Ravynn
"Good."

-> ravynn_philosophy

=== ravynn_style_delegate ===
~ Ravynn_Affection += 0

#speaker:{Name}
"I delegate. That’s what having a crew is for."

(Ravynn glances — disappointed — at a rope coil.)

#speaker:Ravynn
"Delegation only works if the crew isn’t made of idiots."

-> ravynn_philosophy

=== ravynn_style_gut ===
~ Ravynn_Affection -= 10

#speaker:{Name}
"I go with my gut."

(She exhales, looking as if I offended logic itself.)

#speaker:Ravynn
"Guts spill. Plans don’t."

-> ravynn_philosophy

=== ravynn_philosophy ===

#speaker:{Name}
"I understand your mindset, but part of the sea’s beauty is its unpredictability. The unknown and wild raw emotion of it — sometimes riding along with the waves is all you can do."

#speaker:Ravynn
"Not for me. Structure is everything. The moment you surrender control is when chaos takes everything."

#speaker:Ravynn
"I’ll keep things running. But if anyone steps out of line? I’ll know — and deal with it my own way."

#speaker:Ravynn
"Enjoy the calm while it lasts, Captain. Life and the seas are never always serene."

* [Steady Admiration]
    -> ravynn_flirt
* [Pushback] 
    -> ravynn_dismiss

=== ravynn_flirt ===
~ Ravynn_Affection += 10
~ ravynn_exit_type = "flirty"

#speaker:{Name}
"You're intense. Really intense. There’s something about it... it's solid. Reliable."

#speaker:Ravynn
"Reliability is the foundation of survival. If that’s what impresses you — good."

#speaker:{Name}
"Impress? I didn’t say that."

#speaker:Ravynn
"You were thinking it though."

#Speaker:{Name}
(She returns to sharpening her harpoon, but I catch the faintest smile.)

As I'm about to leave I catch a glance of one of her belongings.

(Let's try asking her about it)
-> END

=== ravynn_dismiss ===
~ Ravynn_Affection -= 10
~ ravynn_exit_type = "disinterested"

#speaker:{Name}
"Right, right — we get it. You’ve got the ship handled. Just make sure your grip doesn’t end up breaking the crew."

#speaker:Ravynn
"If they can’t handle it, they shouldn’t be out here."

#speaker:{Name}
"Not everyone is built like steel, Ravynn."

#speaker:Ravynn
"Then they’ll break. But I won’t."

#Speaker:{Name}
Sensing the tension my gaze awkwardly shifts until it lands upon an item.

(Let's try to change the topic and ask about this)
-> END