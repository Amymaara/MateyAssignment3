INCLUDE Globals.ink

// HP variables
VAR playerHP = 80
VAR krakenHP = 100

// Damage variables
VAR krakenDamage = 12
VAR playerDamage = 9

// check if help used
VAR helpUsedPearl = false
VAR helpUsedShad = false
VAR helpUsedRory = false
VAR helpUsedRavynn = false

-> start
#music_Horror-258261
=== start ===
#Speaker:Stu
#music_Horror-258261
The Kraken rising from the depths trashes his tentacles towards your ship.

#Speaker:Stu
"It's time to act, Cap'n {Name}!"

-> player_turn

=== player_turn ===

What do you decide?

+ [Fight] -> fight 
+ [Talk] -> talk
+ [Help] -> help
+ [Gift] -> popup_1

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
#win
You have defeated the kraken
-> END

=== player_defeated ===
#lose
You have Lost

-> END

=== talk ===
#speaker:{Name}
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
+ [Nevermind] -> player_turn

=== help_pearl ===

You call out:

#Speaker:{Name}
"Pearl, a little help?"

{ Pearl_Affection >= 35:
 Pearl sings, the Kraken wails at how tone deaf she is.
 
 ~ helpUsedPearl = true
 ~ temp finalDamage = 9 * 3
 ~ krakenHP -= finalDamage
 
 #Speaker:{Name}
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

{Shad_Affection >= 35:
Shad throws you a suspicious pie that smells.. vaguely radioactive.

#Speaker:Shad
"Don't ask! Just throw it!"

~ helpUsedShad = true
~ temp finalDamage = 9 * 3
~ krakenHP -= finalDamage

You launch the pie at the Kraken. It explodes on impact - in pie we crust. {finalDamage} done!

-> kraken_hp_check

- else:

#speaker:{Name}
Shad shrugs

#Speaker:Shad
"Sorry Cap'n {Name}, Kitchens closed after operating hours unless you're on my good side."

-> player_turn
}

=== help_rory ===

You shout:

{Rory_Affection >= 35:
#Speaker:{Name}
"Master Porthole! Now would be a good time for some flair!"

#speaker:{Name}
With elegance, Master Porthole tosses you a blunderbass.

#Speaker:Master Porthole
Don't get it dirty, that gun costs more than this ship."

~helpUsedRory = true
~ temp finalDamage = 9 * 3
~ krakenHP -= finalDamage

The Kraken reels as you shoot his tentacles with costly lead! {finalDamage} damage afflicted!

-> kraken_hp_check

- else:

#speaker:{Name}
Master Porthole scuffs at you.

#Speaker:Master Porthole
"Earn my attention first, Captain {Name}."

-> player_turn
}

=== help_ravynn ===
#speaker:{Name}
"Ravynn, this would be a good time for planned precision!"

{Ravynn_Affection >= 35:

#speaker:{Name}
Ravynn wordlessly tosses you a dagger, it has gold swirls on the hilt.

#Speaker:Ravynn
"Aim for the eye."

~helpUsedRavynn = true
~ temp finalDamage = 9 * 3
~ krakenHP -= finalDamage

You hurl the dagger at the beast - it strikes true. The Kraken lets out a furious bellow. You hit for {finalDamage} damage!

-> kraken_hp_check

- else:

#speaker:{Name}
Ravynn glances at you unimpressed. 

#speaker:Ravynn
"You want my help? Tell me one reason you deserve it."

-> player_turn
}


=== popup_1 ===
Are you sure you want to gift?

+ [Yes]
    -> popup_2
+ [No]
    -> player_turn

=== popup_2 ===
Really sure?

+ [Yes]
    -> popup_3
+ [No]
    -> player_turn

=== popup_3 ===
This isn’t something you can undo.

+ [Yes]
    -> popup_4
+ [No]
    -> player_turn

=== popup_4 ===
You realise what this means, right?

+ [Yes]
    -> popup_5
+ [No]
    -> player_turn

=== popup_5 ===
The crew... they trust you.

+ [Yes]
    -> popup_6
+ [No]
    -> player_turn

=== popup_6 ===
You’re not just doing this to feel important, are you?

+ [Yes]
    -> popup_7
+ [No]
    -> player_turn

=== popup_7 ===
No take-backs. No retries. No “Oops.”

+ [Yes]
    -> popup_8
+ [No]
    -> player_turn

=== popup_8 ===
They're watching you.

+ [Yes]
    -> popup_9
+ [No]
    -> player_turn

=== popup_9 ===
Do you even know what the gift does?

+ [Yes]
    -> popup_10
+ [No]
    -> player_turn

=== popup_10 ===
You're postitive it's still a yes?

+ [Yes]
    -> popup_11
+ [No]
    -> player_turn

=== popup_11 ===
You’re not a good person for doing this, you know.

+ [Yes]
    -> popup_12
+ [No]
    -> player_turn

=== popup_12 ===
Okay. But don’t cry later.

+ [Yes]
    -> gift
+ [No]
    -> player_turn
=== gift ===
#speaker:{Name}
You reach into your coat and pull out a glimmering keepsake, your golden compass - the signal.

#speaker:{Name}
A promise - to your beloved.

#speaker:{Name}
From the depths, it- no, he reposonds. Not with the anticipated fury but with familiarity.

#speaker:{Name}
Your crew watches in horror as the realisation dawns upon them.

#speaker:{Name}
This wasn't an act of desperation.

#speaker:{Name}
No, it was a transaction.

#speaker:{Name}
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

#speaker:{Name}
"No, I'm free."

#speaker:{Name}
The sea roars.

#speaker:{Name}
Tentacles wrap around them, one by one.

#speaker:{Name}
They scream, they struggle - how pointless.

#speaker:{Name}
Their weapons fall, their names lost to the sea.

#speaker:{Name}
You stand, you watch. You feel no fear, no remorse.

#speaker:{Name}
There only exists devotion.

#krakenEnd
//You have found the Secret

-> END