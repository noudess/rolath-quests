sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount,  19930 =>1 )) 
		{
		quest::summonitem(19918);
		# Verified on live.
		quest::faction(336,5);
		quest::faction(229,5);
		quest::faction(329,1);
		quest::faction(230,1);
		quest::faction(330,1);
		}
	$npc->Depop(0);
	}
