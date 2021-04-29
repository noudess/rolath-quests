sub EVENT_SAY 
	{
    if ($text=~/hail/i) 
		{
        quest::say("Greetings $name. We do not get too many visitors to the island. I have a few pieces of armor for sale, fashioned for the small of course.");
    	}
	}

sub EVENT_ITEM
	{
	#:: Match a 13995 - Knight
	if ($faction < 5 && plugin::takeItems(13995 => 1))
		{
		quest::say("Ahh! You must have been sent by Beno of the Stormguard. I have been wondering when he would return my card. I have not been playing with a full deck. How about a reward? Hmm. Let's see what I have lying around... Here! Take this. I cannot possibly give you any of my good armor.");

		my $roll = int(rand(29));
		my $reward;

		if ($roll < 2) # 2/30 Dwarven Ringmail Tunic
			{
			$reward = 3301;
			}
		elsif ($roll < 5) # 3/30 Blackened Iron
			{
			if (int(rand(11)) == 0)
				{
				$reward = 3040; # BI Helm
				}
			else
				{
				$reward = plugin::RandomRange(3042, 3051); # Other BI
				}
			}
		elsif ($roll < 11) # 6/30 Bronze Armor
			{
			$reward = plugin::RandomRange(4201, 4236);
			}
		elsif ($roll < 17) # 6/30 Ringmail Armor
			{
			$reward = plugin::RandomRange(3101, 3136);
			}
		else # 12/30 Weapon or Shield
			{
			$reward = quest::ChooseRandom(7012, 7015, 9009); # Bronze Weapon
			}
		
		quest::summonitem($reward);

		#:: Ding!
		quest::ding();

		#:: Set factions
		quest::faction(312, 5);     #:: + Storm Guard
		quest::faction(274, 1);     #:: + Kazon Stormhammer
		quest::faction(293, 1);     #:: + Miners Guild 249
		quest::faction(290, 1);     #:: + Merchants of Kaladim
		quest::faction(232, -1);    #:: - Craknek Warriors
		                            #:: Grant a small amount of experience
		quest::exp(500);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
