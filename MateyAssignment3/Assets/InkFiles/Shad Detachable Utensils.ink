INCLUDE Globals.ink

-> shad_kitchentools
=== shad_kitchentools ===

{shad_exit_type == "flirty":
    -> tools_flirty
- else:
    -> tools_disinterested
}

=== tools_flirty ===

#Speaker:{Name}
Kitchen tools lie hanging on the wall with strange bolts where handles should be.

#Speaker:{Name}
"Let me guess. Prosthetic cooking arm attachments?"

#Speaker:Shad
"Meet Mr Whisk and Captain Stir. They're both realiable and dashingly functional"

#Speaker:{Name}
"Do you name all your tools?"

#Speaker:Shad
"They’re part of me - might as well treat them like friends, if i'm honest I can't live without them."

#Speaker:{Name}
"Sounds like they see more action than some of our crewmates."

#Speaker:Shad
"Jealous?"

-> END

=== tools_disinterested ===

#Speaker:{Name}
I glance at the odd-looking spoon and whisk - bolted, worn, and clearly repurposed.

#Speaker:{Name}
"You rigged your tools into your arm?"

#Speaker:Shad
"Yeah. Saves time and keeps them close."

#Speaker:{Name}
"That’s... intense."

#Speaker:Shad
"Cooking is intense. These aren’t just utensils."

#Speaker:{Name}
He doesn’t explain further. Just polishes the spoon with quiet focus.

-> END