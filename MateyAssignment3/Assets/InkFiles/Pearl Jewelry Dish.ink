INCLUDE Globals.ink
-> pearl_jewellery_dish_scene

=== pearl_jewellery_dish_scene ===

{pearl_exit_type == "flirty":
-> dish_flirty

- else:
-> dish_disinterested
}

=== dish_flirty ===
#Speaker:{Name}
Nestled on Pearl’s table is a shell, pink on the inside, white on the outside. It’s cracked open just enough to reveal a cluster of starfish earrings and a pearl necklace.

#Speaker:{Name}
"That your treasure stash?"

#Speaker:Pearl
"Don’t tease. These are the only accessories that don’t rust on me."

#Speaker:{Name}
I pick up one of the earrings, gently. It's warm, delicate. It's as if it remembers being in the sea.

#Speaker:{Name}
"They suit you. Soft, pretty, a little bit dangerous if stepped on."

#Speaker:Pearl
"You’re the first person who’s ever described me like an exotic barnacle."

#Speaker:{Name}
"I meant it in the most flattering way."

#Speaker:Pearl
"I found the shell after a special moment - the first dive I took. I was terrified... then I saw it, half-buried in coral, it felt like it was meant for me."

#Speaker:{Name}
"You kept it, after all these years?"

#Speaker:Pearl
"It reminded me not all change is bad and that not all treasure is gold."

-> END

=== dish_disinterested ===

#Speaker:{Name}
A clamshell dish sits slightly open on the table. Inside is a tangled pile of jewellery - some starfish earrings and a knotted pearl chain or two.

#Speaker:{Name}
"Bit messy."

#Speaker:Pearl
"Well I don't exactly have OCD."

#Speaker:{Name}
"So, you use these to decorate yourself?"

#Speaker:Pearl
"I found the shell on my first dive. It was the first thing that didn’t scare me underwater."

#Speaker:{Name}
"...Oh."

#Speaker:{Name}
I nod, but I don’t say anything. Some stories don’t need replies.

-> END

