INCLUDE Globals.ink

-> shad_recipebottle
=== shad_recipebottle ===

{shad_exit_type == "flirty":
    -> recipe_flirty
- else:
    -> recipe_disinterested
}

=== recipe_flirty ===

#Speaker:{Name}
On a barrel sits a sealed glass bottle, upright, weighted with sand and holding a tightly rolled scroll inside.

#Speaker:{Name}
"Is this the bottle you found it in?"

#Speaker:Shad
"Yes! I swear Great Gram-Gram used to keep this bottle in her kitchen shelf."

#Speaker:{Name}
"And you’ve kept it ever since?"

#Speaker:Shad
"One day I’m gonna cook it. Taste something no one’s tasted in decades."

#Speaker:{Name}
He glances at the bottle with something close to reverence.

#Speaker:Shad
"Adventure tastes best when it’s seasoned with mystery and familiarity. You know what they say, nothing tastes like home. Want a taste too, Cap'n {Name}?"

#Speaker:{Name}
"...Only if you feed it to me."

#Speaker:Shad
"Careful, Captain {Name}. Say things like that and I’ll start imagining dessert or seconds."

-> END

=== recipe_disinterested ===

#Speaker:{Name}
A bottle sits on a barrel, upright, with a scroll inside.

#Speaker:{Name}
"That looks unnecessarily dramatic for a recipe."

#Speaker:Shad
"It’s not dramatic - it’s preserved. That scroll inside it holds flavour lost to history."

#Speaker:{Name}
"Mhm... it's not even legible."

#Speaker:Shad
"...Yeah, but it matters. It's one of the few things I found after losing everything."

#Speaker:{Name}
He gently taps the glass, and it clinks softly. He doesn’t say anything else.

-> END