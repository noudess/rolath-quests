
sub EVENT_SAY
	{
	if($faction <= 6 && $text=~/substance of an experimental nature/i)
		{
		quest::say("The infamous Mage, Najena employs several apprentices. These apprentices are most likely well equiped with just the reagents I need. Perhaps you can relieve them of their burden for me? Bring me 3 pouches of reagents from the Mages and you'll have the substance.");
		}
	else
		{
		quest::say("Leave before I call the guard. Don't come back, $race.");
		}
	}

sub EVENT_ITEM
	{
	# Reagent pouch ID-1797
	# Faction is a guess tested at dubious (fail), apprehensive (sucess) and ally (sucess)
	if($faction <= 6 && $itemcount{1797} == 3)
		{
		quest::say("Ahh wonderful work $name Here is the substance....don't spill it HAHAHAaahhahehehe...yes......you don't want to spill that heheh.");

		quest::ding();
		quest::exp(200);
		## # Putrid substance 
		quest::summonitem(1793);
		#Factions verified on ZAM
		# Bloodsabers Faction 
		quest::faction(221,"2");
		# Opal Dark Briar Faction
		quest::faction(296,"1");
		# Corrupt Qeynos Guards Faction
		quest::faction(230,"1");
		# Guards of Qeynos Faction
		quest::faction(262,"-1");
		#  Priests of Life Faction
		quest::faction(341,"-1");
		}
	else
		{
		plugin::return_items(\%itemcount);
		}

	}

#END of FILE Zone:freportw  ID:9013 -- Driana_Poxsbourne
