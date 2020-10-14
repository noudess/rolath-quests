sub EVENT_ITEM 
	{
	if($faction <= 6 && plugin::check_handin(\%itemcount, 6980 => 1, 6978 => 1)) 
		{ #Kejek Spirit Powder, Fading Soul Orb

		# Count how many souls freed..
		$varname="FreedSouls$charid";
		if (!defined($qglobals{$varname}))
			{
			$spiritcount=1;
			}
		else
			{
			$spiritcount=$qglobals{$varname} + 1;
			}
		quest::setglobal($varname,$spiritcount,1,"F");

		quest::emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
		quest::summonitem(2577); #Shattered Fading Soul Orb

		# See if the Elder Vah`Shir took notice.
		$chance = 5 * $spiritcount;
		$chance = $chance >= 20 ? 20 : $chance;
		# For now, disable Elder
		$chance=0;
		$roll=plugin::RandomRange(0,100);	

		quest::say("chance: $chance, roll: $roll");
		if ($roll > $chance)
			{
			quest::spawn2(quest::ChooseRandom(100223,100224),328,0,$x+5, $y+5, $z+5, $h); #Apparitions
			}
		else
			{
			# Spawn special Elder Vah Shir
			quest::spawn2(110231,328,0,$x+5, $y+5, $z+5, $h);
			}

		# Factions verified on live
		quest::faction(473,2); #Kejek Village
		quest::faction(298,1); #Peace Keepers
		quest::exp(50000);
		quest::ding();
		}
	else 
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("We should make sure to invite Korvik, brother.  Unless you fear that may mean we run out of ale!  He has some stories to tell when he is invigorated by spirit.");
	}
