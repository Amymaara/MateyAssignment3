INCLUDE Globals.ink

-> pearl_jar_scene

=== pearl_jar_scene ===

{pearl_exit_type == "flirty":
-> jar_flirty

-else:
-> jar_disinterested
}

=== jar_flirty ===

#Speaker:{Name}
Tucked neatly on her shelf, I notice a jar — round at the base, wrapped in netting and tied with a chain. Tiny pearl decorate its neck, glimmering brilliantly.

#Speaker:{Name}
The water inside isn’t still — it swirls like it has somewhere to be. Somewhere it belongs.

#Speaker:{Name}
"You carry the sea around with you?"

#Speaker:Pearl
"Mmh. From back home. I like to take a sniff when I miss it. Not glamorous, I know."

#Speaker:{Name}
"I like that idea, taking a bit of home with you on your journey."

#Speaker:{Name}
"Plus that jar sure is dressed to impress, reminds me of a pretty sea enthusiast."

#Speaker:Pearl
"You’re flirting with a water jar, Captain {Name}."

#Speaker:{Name}
"No, I’m flirting with the girl who needs it."

#Speaker:{Name}
She touches the netting gently, eyes distant.

#Speaker:Pearl
"Careful. If you keep saying things like that, I might start needing you too."

-> END

=== jar_disinterested ===
#Speaker:{Name}
A jar sits by the edge of her shelf. There’s a cork stuck in it and some water inside, darker blue, swirling slowly.

#Speaker:{Name}
"What's that? Some sea potion or something?"

#Speaker:Pearl
"...It’s just seawater. From home."

#Speaker:{Name}
"You kept seawater? Couldn’t you just, like, scoop some up every morning?"

#Speaker:Pearl
"It’s not the same. That place doesn’t exist anymore... not for me."

#Speaker:{Name}
I look at the jar again. The water swirls on, undisturbed by my clumsy words.

#Speaker:Pearl
"I bring it everywhere. It’s silly, but it keeps me grounded."

#Speaker:{Name}
"...Right."

-> END

