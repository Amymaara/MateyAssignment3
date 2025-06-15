INCLUDE Globals.ink

-> pearl_stu_followup

=== pearl_stu_followup ===

{ pearl_exit_type == "flirty":
-> pearl_stu_flirty
- else:
-> pearl_stu_disinterested
}

=== pearl_stu_flirty ===
#Speaker:{Name}
I'm almost at the end of the corridor when a familiar feathered friend brushes past me.

#Speaker:Stu
#pose:Pose1
"Squaaak - saw you vanish in Pearl's den of sparkles and sea trauma. Everything alright?"

#Speaker:{Name}
"More or less. Mentally? That's...still under review."

#Speaker:Stu
#pose:Pose2
"She do the transformation thing? The sardine situation?"

#Speaker:{Name}
I blink.

#Speaker:{Name}
He blinks back.

#Speaker:{Name}
"Yeah. She showed me, and told me."

#Speaker:Stu
#pose:Pose1
"Bold move, braver than most people I know."

#Speaker:{Name}
"She's still beautiful. It doesn't change anything."

#Speaker:Stu
#pose:Pose2
"Beautiful? Captain {Name}, she's halfway to being a cursed fish buffet. That takes a specific taste."

#Speaker:{Name}
"It's a taste I don't mind acquiring."

#Speaker:Stu
#pose:Pose1
"Careful. One second you’re holding her fin, the next you’re attending aquatic couples therapy."

#Speaker:{Name}
Despite everything - the chaos, the curse and the pressure of everything. I manage a smile.

#Speaker:{Name}
The feels peaceful tonight.

-> END

=== pearl_stu_disinterested ===

#Speaker:{Name}
Stu finds his way to me, as he always done. Only this time he has an even more pronounce look of displeasure.

#Speaker:Stu
#pose:Pose2
"Squawk - Aren't you the anti-casanova."

#Speaker:{Name}
"She has gills and glitter, Stu. I needed a moment."

#Speaker:Stu
#pose:Pose1
"Hey, no judgement. I once dated a mimic - unknowingly. Took me a month before I realised she wasn't actually a statue."

#Speaker:{Name}
"...What?"

#Speaker:Stu
#pose:Pose1
"But she's been carrying that weight alone."

#Speaker:Stu
#pose:Pose2
"Point is - she's still Pearl. Just with more scales and emotional trauma."

#Speaker:{Name}
"I just..I don't know how to deal with things like this."

#Speaker:Stu
#pose:Pose1
"Tell her she's more than her curse. Tell her that over and over again, until she hears it enough to look past her shame."

#Speaker:{Name}
I don't reply. Stu doesn't push further.

#Speaker:{Name}
The ship rocks gentle beneath us, but my guilt makes me wish the sea was more turbulent - to match the feelings in my heart.

-> END