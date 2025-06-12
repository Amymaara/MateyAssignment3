INCLUDE Globals.ink

-> storm_intro


=== storm_intro ===
#music_Atlantic-storm-58999

#Speaker:{Name}
#sfx_Sea-waves-7131
The sea cried that night. Winds howled, waves like blades, cutting into the ship. 

#Speaker:{Name}
My stars - gone and with them my hope.

#Speaker:{Name}
Everything felt wrong.

#Speaker:{Name}
But I didn’t move, I just stood there drenched, clinging to pride or stubbornness

#Speaker:{Name}
… I don’t even know. 

#Speaker:{Name}
Then came the first scream. #sfx_Scream-85294

#Speaker:{Name}
Gone, pulled into the sea, another name lost to the ocean.

#Speaker:{Name}
This wasn’t the sea that I knew.

#Speaker:{Name}
No, tonight it’s a deathbed. 

#Speaker:{Name}
The ship jerked, I hit the deck - hard. 

#Speaker:{Name}
The stinging of rain, chaos, even more screams.

#Speaker:{Name}
How did I react again?  

#Speaker:{Name}
Oh yes...

*   Regain composure 
    -> regain_composure
*   Stumble and fall 
    -> stumble_fall

=== regain_composure ===
#Speaker:{Name}
//footstep sound
I forced myself up, I tried my damndest to steady myself against the ship's sway. I grabbed my harpoon and aimed through the storm.

-> kraken_attack

=== stumble_fall ===
#Speaker:{Name}
I fell, my legs gave out again and again, my hands slipping on the soaked terrain. I reached around me for anything and found my harpoon. I was shaking, but alive.

-> kraken_attack

=== kraken_attack ===
#Speaker:{Name}
Another tentacle. But this one was bigger, meaner. Not squid like, no...
 
#Speaker:{Name}
this was different - violent, malevolent. 

#Speaker:{Name}
I gripped my compass, knuckles going white. 

#Speaker:{Name}
Luck never favoured me. No, I fought for everything I had. Every scar, every coin, every bit of respect.

#Speaker:{Name}
And I solemnly swear to the heavenly beings cursing me that I will not go down with this ship.

#Speaker:{Name}
But thinking, idling - costs everything.

#Speaker:{Name}
I hear another scream, another crewmate gone. In the blink of an eye. #sfx_Scream-85294

#Speaker:{Name}
#sfx_Walking-on-a-wet-surface-41742
I ran to the wheel, my boots slipping against the wet planks but I held on. 

#Speaker:{Name}
I tried to steer, to guide my beauty out of this nightmare but neither the Kraken nor the sea had any intention of letting me go.

#Speaker:{Name}
#sfx_Thunder-307513
Lightning again. A tentacle slamming down - it’s about to hit me.

I…

*   Make the shot
    -> make_shot
*   Miss
    -> miss_shot

=== make_shot ===
#Speaker:{Name}
#sfx_Arrow-hitting-target-83810
I lifted my harpoon. I remembered all my training. Deep breath, I fired. Success - dead center.

-> aftermath


=== miss_shot ===
#Speaker:{Name}
#sfx_Arrow-hitting-target-83810
My aim was off, I grazed it but not enough. 

-> aftermath

=== aftermath ===
#Speaker:{Name}
The damage was done, I saved myself but the wheel was gone - splintered.  #sfx_Log-split-88986
#Speaker:{Name}
We were stuck. 

#Speaker:{Name}
There were only two of us and one thing left to try.

#Speaker:{Name}
I released the ballast.

#Speaker:{Name}
The ship tilted violently. I was thrown overboard.

#Speaker:{Name}
But so was she - my last crewmate.

#Speaker:{Name}
Falling towards the beast.

#Speaker:{Name}
I tried reaching out, I tried saving her. #sfx_Girl-screaming-sound-effect-259472

#Speaker:{Name}
I couldn’t save her.

#Speaker:{Name}
I lost her.

#Speaker:{Name}
My strength, my crew, my ship, my compass. 

#Speaker:{Name}
All of it was gone.  

#Speaker:{Name}
I hit the ocean.

#Speaker:{Name}
Everything went dark as I sank into the abyss.

-> END
