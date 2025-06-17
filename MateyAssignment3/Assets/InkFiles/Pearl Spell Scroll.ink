INCLUDE Globals.ink
-> pearl_spell_scroll_scene

=== pearl_spell_scroll_scene ===

{pearl_exit_type == "flirty":
-> scroll_flirty

-else:
-> scroll_disinterested
}

=== scroll_flirty ===

#Speaker:{Name}
There’s a scroll sitting next to Sardinella, its parchment curled and bound in dark thread, edges torn and sea-worn.

#Speaker:{Name}
"Ancient artefact, or failed attempt at poetry?"

#Speaker:Pearl
"Neither. It’s the reason I have gills and oddly flexible legs."

#Speaker:{Name}
I blink.

#Speaker:{Name}
"Wait...this is the spell? The one that turned you into... well, you?"

#Speaker:Pearl
"Yes, courtesy of a sea witch who doesn’t believe in return policies."

#Speaker:{Name}
"That’s wild, do you keep it in case you ever want to reverse it?"

#Speaker:Pearl
"Sometimes. Other times, I just read it for laughs. I still can’t pronounce the last word...might explain why the spell half-worked."

#Speaker:{Name}
I step closer, brushing my fingers just above the parchment.

#Speaker:{Name}
"If I learn to pronounce it... maybe I’ll curse myself into something just as interesting."

#Speaker:Pearl
"Careful. You might end up with seaweed for lungs and a romantic interest in kelp."

#Speaker:{Name}
"Sounds worth it if it brings me a little closer to understanding you."

#Speaker:Pearl
She goes quiet, but I see a smile tug on the edges of her lips.

-> END

=== scroll_disinterested ===
#Speaker:{Name}
A brittle scroll rests next to a fishbowl. The parchment looks older than Stu’s sense of humour.

#Speaker:{Name}
"What’s this? Pirate bedtime story?"

#Speaker:Pearl
"It’s the spell that changed my life."

#Speaker:{Name}
"...Oh."

#Speaker:Pearl
"Yeah. I messed it up. Didn’t pronounce the last word right and ended up like... this."

#Speaker:{Name}
"Why keep it, then?"

#Speaker:Pearl
"Because it reminds me that one mistake can cost you everything and sometimes, I need to remember that before making another."

#Speaker:{Name}
I say nothing. I'm not sure what I could reply.

-> END