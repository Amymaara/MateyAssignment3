INCLUDE Globals.ink

-> follow_ravynn
=== follow_ravynn ===
#music_Celtic-moon-loop-1-284914
 #Speaker:{Name}
 The deck is spick an span, but also very quiet. 
 
 Ravynn is inspecting a pulley with the tenderness of a solier preparing for an ambus.
 
 She doesn't even glance my way when I walk up.
 
 #Speaker:Ravynn
 #pose:Pose3
 #expression:Angry
 "You followed, why?"
 
 #Speaker:{Name}
 Mainly out of curiousity, or I might just like being glared at."
 
 #Speaker:Ravynn
 #pose:Pose2
 #expression:Angry
 "You shouldn't waste your time here."
 
 #Speaker:{Name}
 
 She moves to methodically adjust a line, no wasted energy or motion - just pure efficiency.
 
 "I followed because you left before I could say anything."
 
 #Speaker:Ravynn
 #pose:Default
 #expression:Angry
 "I said what I needed to say"
 
 #Speaker:{Name}
 "I wanted to understand."
 
 #Speaker:Ravynn
 #pose:Default
 #expression;Angry
 "Understanding is earned, not gifted."
 
 #Speaker:{Name}
 "It's lonely to always be misunderstood."
 
 She finally looks at me, eyes sharp like a blade ready to cut you.
 
 #Speaker:
 #pose:Pose2
 #expression:Sad
 
 "Everyone keeps thinking I'm harsh, cold, even dangerous. But I've watched endless crews die because of these things I'm so strict about."

 "Order is how I survive, if that makes me hard to like."
 
 "Then so be it."
 
 * [Tethered by tension]
 -> ravynn_flirty
 *[Let go of the line]
 ->ravynn_disinterested
 
 === ravynn_flirty ===
 ~ Ravynn_Affection +=10
 ~ ravynn_exit_type = "flirty"
 
 #Speaker:{Name}
 "You're not hard to like, Ravynn."
 
 "You're just...sharp edged."
 
 "And sometimes that's exactly what keeps people afloat at sea."
 
 She blinks one, maybe it's out of surprise or confusion. I can't read her facial expressions.
 
 #Speaker:Ravynn
 #pose:Pose2
 #expression:Blush
 "Keep talking like that and I'll take it as you want to cut on purpose."
 
 #Speaker:{Name}
 "Wouldn't be the worst scare I've earned."
 
 She steps closer, just enough so that I can notice her warmth.
 
 #Speaker:Ravynn
  #pose:Pose2
 #expression:Angry
 "If you're flirting, you're playing with fire."
 
 #Speaker:{Name}
 "Well I've always wanted to see how close i'd get without burning."
 
 She's silent for a beat, then she exhaled sharply.
 (It's as if she's amused with this whole situation)

#Speaker:Ravynn
#pose:Pose2
 #expression:Angry
"I don't melt, I don't burn easily either."

#Speaker:{Name}

She brushes past me, her voice lower.

#Speaker:Ravynn
# #pose:Default
 #expression:Blush
"But if you wanna test heat...you better be prepared."

#Speaker:{Name}

She doesn't turn around, yet her words linger.

Feeling slightly flushed I begin to be more aware of my surroundings

(Huh, did she always have this? Let's ask about it.)

-> END

=== ravynn_disinterested ===
~ Ravynn_Affection -= 10
~ ravynn_exit_type = "disinterested"

#Speaker:{Name}
"That might be your way of surviving but you're not the only one who's lost people."

She pauses for a moment.

#Speaker:Ravynn
#pose:Default
#expression:Angry
"Good. Then I don't need to worry."

#Speaker:{Name}

She nods, professional and curt. Her gaurd not dropping for a second.

#Speaker:Ravynn
#pose:Default
#expression:Angry
"You should go, the wind's changing."

#Speaker:{Name}
"And you'd rather be alone for it?"

#Speaker:Ravynn
#pose:Pose3
#expression:Angry
"Always."

#Speaker:{Name}

Feeling bitter, I try one last time to talk with her before heading out.
(Maybe asking about her items would break the tension?)

-> END