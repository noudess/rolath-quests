sub EVENT_SAY
	{
	if ($text=~/hail/i)
		{
		quest::emote("flashes you a wide grin");
		quest::say("Hello there, $name.  I assume you are here to make your way to Broken Skull Rock.  I am currently the only sailor brave enough to take my ship there, the residents are not at all pleasant to intruders.  The Kejekians were kind enough to share their dock with me, for the most part I just shuttle supplies to the [lighthouse].");
		}

	if ($text=~/lighthouse/i)
		{
		quest::say("The residents of Gunthak's lighthouse are people who have cause to fight the forces of Broken Skull.  Most are people who once served there, either willingly or otherwise.  Well, if you so desire, you may board my ship and head below deck.  As soon as the rest of my supplies arrive I'll be more than happy to shuttle you to the Gulf of Gunthak with my delivery.");
		}
	}
