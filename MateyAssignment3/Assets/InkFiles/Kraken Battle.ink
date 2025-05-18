INCLUDE Globals.ink

// HP variables
VAR playerHP = 80
VAR krakenHP = 100

// Damage variables
VAR krakenDamage = 15
VAR playerDamage = 8

// check if help used
VAR helpUsedPearl = false
VAR helpUsedShad = false
VAR helpUsedRory = false
VAR helpUsedRavynn = false


-> start

=== start ===

The Kraken rising from the depths trashes his tentacles towards your ship.

#Speaker:Stu
"It's time to act, Cap'n {Name}!"

-> player_turn

=== player_turn ===

What do you decide?

+ [Fight] -> fight 
+ [Talk] -> talk
+ [Help] -> help
+ [Gift] -> gift

=== fight ===

You ready your cutlass and strike the tentacles!

~ krakenHP -= playerDamage

-> kraken_hp_check

=== kraken_hp_check ===

// checks to see if kraken is defeated after attack.

{krakenHP <= 0:
-> kraken_defeated
- else:
-> kraken_turn
}

=== kraken_turn ===

The Kraken thrashes its tentacles and smashes into you!

~ playerHP -= krakenDamage

-> player_hp_check

=== player_hp_check

//checks to see if player is defeated after attack.
{playerHP <=0:
-> player_defeated
- else:
-> player_turn
}

=== kraken_defeated ===
#tag: win

-> END

=== player_defeated ===
#tag: lose

-> END

=== talk ===
You wink and run your hand through your sea soaked hair.

#Speaker:{Name}
"Look Deep Sea Daddy... you're kind of cute when you're all riled up like that."

~ temp flirtOutcome = RANDOM(0,1)
{ flirtOutcome == 0:
The Kraken pauses mid-swipe, did it just...blush?
It shfits awkwardly.

#Speaker:Kraken
"Krr Krra Krraken..."
(translation: flattery will get you nowhere...maybe.)

Maybe out of confusion or flattery, his next attack isn't as rough as before.

~ krakenDamage = 10

-> kraken_turn

- else:

The Kraken roars, splashes water everywhere. That didn't work.

-> kraken_turn
}

=== help === 

You need support. Who do you ask?

* { helpUsedPearl == false } [Pearl] -> help_pearl
* { helpUsedShad == false } [Shad] -> help_shad
* { helpUsedRory == false } [Master Porthole] -> help_rory
* { helpUsedRavynn == false } [Ravynn] -> help_ravynn
* [Nevermind] -> player_turn

=== help_pearl ===

You call out:

#Speaker:{Name}
"Pearl, a little help?"

{ Pearl_Affection >= 45:
 Pearl sings, the Kraken wails at how tone deaf she is.
 
 ~ helpUsedPearl = true
 ~ temp finalDamage = 8 * 3
 ~ krakenHP -= finalDamage
 
 Whilst weakened you charge and strike the beast for {finalDamage} damage!
 
 -> kraken_hp_check
 
 - else:
 
 Pearl is too busy trying to call for dolphins. Maybe you should haven nicer.
 }
 
 -> player_turn
 
 === help_shad ===
 
You call out:

#Speaker:{Name}
"Shad! now's your time to shine cook up something lethal!"

{Shad_Affection >= 45:
Shad throws you a suspicious pie that smells.. vaguely radioactive.

#Speaker:Shad
"Don't ask! Just throw it!"

~ helpUsedShad = true
~ temp finalDamage = 8 * 3
~ krakenHP -= finalDamage

You launch the pie at the Kraken. It explodes on impact - in pie we crust.

-> kraken_hp_check

- else:

Shad shrugs

#Speaker:Shad
"Sorry Cap'n {Name}, Kitchens closed after operating hours unless you're on my good side."

-> player_turn
}

=== help_rory ===

You shout:

{Rory_Affection >= 45:
#Speaker:{Name}
"Master Porthole! Now would be a good time for some flair!"

With elegance, Master Porthole tosses you a blunderbass.

#Speaker:Master Porthole
Don't get it dirty, that gun costs more than this ship."

~helpUsedRory = true
~ temp finalDamage = 8 * 3
~ krakenHP -= finalDamage

The Kraken reels as you shoot his tentacles with costly lead!

-> kraken_hp_check

- else:

Master Porthole scuffs at you.

#Speaker:Master Porthole
"Earn my attention first, Captain {Name}."

-> player_turn
}

=== help_ravynn ===

"Ravynn, this would be a good time for planned precision!"

{Ravynn_Affection >= 45:

Ravynn wordlessly tosses you a dagger, it has gold swirls on the hilt.

#Speaker:Ravynn
"Aim for the eye."

~helpUsedRavynn = true
~ temp finalDamage = 8 * 3
~ krakenHP -= finalDamage

You hurl the dagger at the beast - it strikes true. The Kraken lets out a furious bellow.

-> kraken_hp_check

- else:

Ravynn glances at you unimpressed. 

#speaker:Ravynn
"You want my help? Tell me one reason you deserve it."

-> player_turn
}

=== gift ===

You reach into your coat and pull out a glimmering keepsake, your golden compass - the signal.

A promise - to your beloved.

From the depths, it- no, he reposonds. Not with the anticipated fury but with familiarity.

Your crew watches in horror as the realisation dawns upon them.

This wasn't an act of desperation.

No, it was a transaction.

A pact, made long ago with your lover.

#Speaker: {Name}
"I give you my crew."

There's a beat of silence.

#Speaker:Pearl
"Surely you're joking."

#Speaker:Shad
"Haha, nice one Cap'n"

#Speaker:Master Porthole
"...what?"

#speaker:Ravynn
"You've gone mad."

#speaker:{Name}

I watch as some nervously laugh, and others draw their weapons.

"No, I'm free."

The sea roars.

Tentacles wrap around them, one by one.

They scream, they struggle - how pointless.

Their weapons fall, their names lost to the sea.

You stand, you watch. You feel no fear, no remorse.

There only exists devotion.

#tag: krakenEnd

-> END
    