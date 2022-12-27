sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 12139 => 1))
		{
		quest::summonitem(18809);	#Bayle List II
		quest::faction(343, 10);	#QRG Protected Animals
		quest::faction(302, 10);	#Protectors of Pine
		quest::faction(272, 10);	#Jaggedpine Treefolk
		quest::faction(366, -30);	#Karana bandits
		quest::exp(200);
		}
	elsif (plugin::check_handin(\%itemcount, 12140 => 1))
		{
		quest::emote("snorts and stamps his feet nearly trampling you!  You have the feeling Mammoth is about to bite you!");
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}

