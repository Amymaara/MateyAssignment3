INCLUDE Globals.ink

-> stu_type
==== stu_type ===
{ pearl_exit_type == "flirty":
-> stu_flirty
- else:
-> stu_disinterested
}
=== stu_flirty ===

#speaker:Stu
"Squaaak — what in the seven seas just happened?"

#speaker:{Name}
"I think I broke her… by flirting."

#speaker:Stu
"Remind me to keep you away from the emotional ones, you heartthrob."

#speaker:{Name}
"Too late. I think she tried to flirt back with that seashell."

We stare at the door for a second, then decide to keep walking away. Fast.

-> END

 === stu_disinterested ===
 
#speaker:Stu
"She seems a bit frazzled,  Captain {Name}. Let’s give her some space to, uh… organise her socks?"

#speaker:{Name}
"Yeah, agreed. Let’s get out of here."

I left Pearl's room. She hummed and tossed things about.  
(I wonder why she got so worked up over what I said?)

-> END