INCLUDE Globals.ink

-> follow_pearl_whisk

=== follow_pearl_whisk ===

#speaker:{Name}
I find Pearl in her room, sitting on her chair watching Sardinella float calmly as she gently hums.

#speaker:{Name}
"Didn’t know you were a sea creature rights activist."

#speaker:Pearl
"Of course I am. That octopus was just trying to help stir something up, probably!"

#speaker:{Name}
"You okay? Still mad at Shad?"

#speaker:Pearl
"No, I’m not mad at him. He just doesn’t think the way I do."

#speaker:Pearl
"We need all types of brains on deck — even if his is ginger flavoured."

(She doesn’t laugh, but rather smiles gently.)

#speaker:Pearl
"I’ve always felt things out there understood me better — sea creatures, the waves, even the stars."

#speaker:Pearl
"But people? They usually think I’m a joke."

#speaker:{Name}
"You’re not."

#speaker:Pearl
"I just saw myself in that octopus. I know he didn’t have bad intentions — he probably saw something shiny and wanted a closer look."

#speaker:Pearl
"And besides, I know what it feels like to be misunderstood."

(She dips her fingers into the bowl and watches the ripples, her face tinted with sorrow.)

* [You're strange]
    -> pearl_follow_flirt
* [Misunderstood?]
    -> pearl_follow_disinterest

=== pearl_follow_flirt ===
~ Pearl_Affection += 10

#speaker:{Name}
"I trust you. And I happen to think you’re exactly the kind of strange that makes this ship worth sailing."

(Her eyes widen. A real blush blooms across her cheeks.)

#speaker:Pearl
"If you keep saying things like that, I’ll have to add you to the list of things that make me swoon dramatically."

#speaker:{Name}
"How long is that list?"

#speaker:Pearl
"Short. But you’ve won yourself first place. Followed by nautilus shells and poems."

(She nudges a bit closer to me. There’s laughter in her voice again — and a hint of something else.)

-> pearl_follow_stu_soft

=== pearl_follow_disinterest ===
~ Pearl_Affection -= 10

#speaker:{Name}
"It’s an octopus. I don’t think it can be 'misunderstood.'"

#speaker:Pearl
(She blinks. Her usual spark is nowhere to be found.)

#speaker:Pearl
"I know I’m weird. I collect shiny things and defend sea animals. Most people don’t find me to be exactly crew material."

#speaker:{Name}
"As long as it doesn’t interfere with the actual sailing of the ship, I don’t really care what you get up to."

(She pauses for just a moment.)

#speaker:Pearl
"Oh. Right. Well... I guess it’s good to know I’m just efficient cargo."

#speaker:{Name}
"Well you’re not the worst we got."

#speaker:Pearl
"Mmh. I’ll take it, I guess."

(She glances away, adjusting her trinkets like she’s building a barrier between us.  
The wind sways her hair and — for the first time since I’ve met her — she doesn’t say anything strange or magical. Just... nothing.)

-> pearl_follow_stu_cold

=== pearl_follow_stu_soft ===

#speaker:{Name}
I exit her room, and Stu flutters down to land on my shoulder, beak tilted like he knows exactly what I’ve done.

#speaker:Stu
"Squaaak — someone’s got a type."

#speaker:{Name}
"Shut up."

#speaker:Stu
"Sparkly. Sings to fish. Blushes when you flirt — it’s practically a siren’s résumé."

#speaker:{Name}
"She’s got a good heart. Even if it’s wrapped in emotional support glitter."

#speaker:Stu
"Well, at least she hasn’t tried to hex you yet. This is going better than your last endeavours."

(I glance at the water. The stars are starting to show.  
Somehow, things feel a little more peaceful tonight.)

-> END

=== pearl_follow_stu_cold ===

#speaker:{Name}
I walk away. The ocean keeps moving — and so do we.

(Stu lands beside me. His talons clink softly on the railing.)

#speaker:Stu
"Squaaak — that sure went well."

#speaker:{Name}
"I wasn’t in the mood for whimsy tonight. Especially not sea metaphors."

#speaker:Stu
"She’s not just metaphors, you know. That girl’s got more heart than half this crew put together."

#speaker:{Name}
"Yeah, well... that gets people killed."

#speaker:Stu
"So does being cold. Let’s hope yours doesn’t freeze over before we reach our destination."

(I don’t answer. The waves crash against the ship.  
Tonight, they feel louder than they should.)

-> END