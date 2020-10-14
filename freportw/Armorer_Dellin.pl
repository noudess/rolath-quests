# reserve militia tunic

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hail!! If you be a new reserve member then show me your Militia Armory Token. If you are not yet initiated then I suggest you head to the Toll Gate in the Commonlands and speak with Guard Valon.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount, 12273 => 1)) 
		{
		quest::say("Welcome to the Freeport Militia. As a reserve member we require you to wear this tunic and fight when, who and wherever Sir Lucan commands, no questions asked!! There is no turning back!! Remember to keep clear of North Freeport. You have made a wise decision. Hail Sir Lucan!!");
		quest::summonitem(3097);
		#Factions verified on ZAM
		quest::faction(330,15); #freeport militia
		quest::faction(336,2); #coalition of tradefolk underground
		quest::faction(281,-1); #knights of truth
		quest::faction(362,-1); #priests of marr
		quest::exp(1038);
		quest::ding();
		}
	else {
	plugin::return_items(\%itemcount);
	}
	}

# EOF zone: freportw ID: 9007 NPC: Armorer_Dellin

