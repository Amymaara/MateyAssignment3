INCLUDE Globals.ink

-> storm_intro


=== storm_intro ===
#music_Atlantic-storm-58999

#sfx_Sea-waves-7131
The sea cried that night. Winds howled, waves like blades, cutting into the ship. 


My stars - gone and with them my hope.

Everything felt wrong.

But I didn’t move, I just stood there drenched, clinging to pride or stubbornness

… I don’t even know. 


Then came the first scream. #sfx_Scream-85294

Gone, pulled into the sea, another name lost to the ocean.

This wasn’t the sea that I knew.

No, tonight it’s a deathbed. 

The ship jerked, I hit the deck - hard. 

The stinging of rain, chaos, even more screams.

How did I react again?  
Oh yes...

*   Regain composure 
    -> regain_composure
*   Stumble and fall 
    -> stumble_fall

=== regain_composure ===
//footstep sound
I forced myself up, I tried my damndest to steady myself against the ship's sway. I grabbed my harpoon and aimed through the storm.

-> kraken_attack

=== stumble_fall ===
I fell, my legs gave out again and again, my hands slipping on the soaked terrain. I reached around me for anything and found my harpoon. I was shaking, but alive.

-> kraken_attack

=== kraken_attack ===

 Another tentacle. But this one was bigger, meaner. Not squid like, no...

this was different - violent, malevolent. 

I gripped my compass, knuckles going white. 

Luck never favoured me. No, I fought for everything I had. Every scar, every coin, every bit of respect.

And I solemnly swear to the heavenly beings cursing me that I will not go down with this ship.

But thinking, idling - costs everything.


I hear another scream, another crewmate gone. In the blink of an eye. #sfx_Scream-85294


#sfx_Walking-on-a-wet-surface-41742
I ran to the wheel, my boots slipping against the wet planks but I held on. 

I tried to steer, to guide my beauty out of this nightmare but neither the Kraken nor the sea had any intention of letting me go.

#sfx_Thunder-307513
Lightning again. A tentacle slamming down - it’s about to hit me.

I…

*   Make the shot
    -> make_shot
*   Miss
    -> miss_shot

=== make_shot ===
#sfx_Arrow-hitting-target-83810
I lifted my harpoon. I remembered all my training. Deep breath, I fired. Success - dead center.

-> aftermath


=== miss_shot ===
#sfx_Arrow-hitting-target-83810
My aim was off, I grazed it but not enough. 

-> aftermath

=== aftermath ===

The damage was done, I saved myself but the wheel was gone - splintered.  #sfx_Log-split-88986

We were stuck. 

There were only two of us and one thing left to try.

I released the ballast.

The ship tilted violently. I was thrown overboard.

But so was she - my last crewmate.

Falling towards the beast.

I tried reaching out, I tried saving her. #sfx_Girl-screaming-sound-effect-259472

I couldn’t save her.

I lost her.

My strength, my crew, my ship, my compass. 

All of it was gone.  

I hit the ocean.

Everything went dark as I sank into the abyss.

-> END
