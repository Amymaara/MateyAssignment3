INCLUDE Globals.ink

-> rory_coinpouch
=== rory_coinpouch ===

{rory_exit_type == "flirty":
-> coin_flirty

- else:
-> coin_disinterested
}

=== coin_flirty ===

#Speaker:{Name}
A pouch nearly bursting with gold coins sits tossed carelessly on the desk.

#Speaker:{Name}
"Planning to bribe someone? Or just showing off?"

#Speaker:Master Porthole
"Darling, that’s just spare change."

#Speaker:{Name}
"Spare change could pay for a ship upgrade. Or three."

#Speaker:Master Porthole
"Then you clearly haven’t seen the price of robes."

#Speaker:{Name}
"You do realise this screams ‘rob me’, right?"

#Speaker:Master Porthole
"If anyone’s brave enough to try, I’ll offer them a fashion advise before I stab them."

#Speaker:{Name}
"...Oddly charming."

-> END

=== coin_disinterested ===

#Speaker:{Name}
I notice a coin pouch slumped on the table, practically exploding with gold.

#Speaker:{Name}
"You're just leaving that out?"

#Speaker:Master Porthole
"It’s not exactly a secret. Anyone who touches it without permission loses a finger."

#Speaker:{Name}
"And yet, it’s still obnoxious."

#Speaker:Master Porthole
"Sorry if I don’t enjoy hiding wealth under floorboards like a pirate cliché."

#Speaker:{Name}
"You're practically a walking cliché."

#Speaker:Master Porthole
"Touché."

-> END
