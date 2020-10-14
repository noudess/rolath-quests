sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Welcome you. You look all skin 'n bones. Eat you must do. Chef Dooga can fix up goodies for you. Try [HEHE meat].");
		}
	if ($text=~/hehe meat/i) 
		{
		quest::say("It is a secret ground meat made with high elf, human, and Erudite Flesh. Mmmm. It good stuff. Dooga make it and [the Gobbler] make it. If you find any of those meats in the swamps bring to me and I pay you.");
		}
	if ($text=~/gobbler/i) 
		{
		quest::say("You no hear of the Gobbler!! Him great butcher. Have all kinds of meat. Him am low on froglok legs. Dooga supply him. Dooga need someone to [deliver froglok legs].");
		}
	if ($text=~/apron/i) 
		{
		quest::say("Apron?! Me gots aprons, but dey no grow on trees. You bring Dooga proof you a butcher first. You makes me three portions of pickled froglok then me allow you to also pay me ten gold for apron.");
		}
	if ($text=~/froglok legs/i) 
		{
		if ($faction > 5)
			{
			quest::say("Come closer. Bouncer smash your head!");
			}
		else
			{
			quest::say("You think so!! That be good thing. Make the Gobbler happy. Maybe he give you something good. Maybe not. You take this. Deliver meat.");
			quest::summonitem(13384);
			}
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13364 => 1  )) 
		{
		quest::say("MmmmMmm. Human make good meat pies. Here. A little coins for you.");
		#Faction verified on ZAM
		quest::faction(228,2); #Clurg
		quest::faction(232,2); #Craknek Warriors
		quest::faction(261,2); #Green Blood Knights
		quest::faction(337,2); #Oggok Gaurds
		quest::faction(274,-2); #Kazon Stormhammer
		quest::givecash(0,0,4,0);
		quest::exp(500);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 13365 => 1  )) 
		{
		quest::say("High elf!! Now that is a good meat. Goes good with Ogre Swill.");
		#Faction verified on ZAM
		quest::faction(228,2); #Clurg
		quest::faction(232,2); #Craknek Warriors
		quest::faction(261,2); #Green Blood Knights
		quest::faction(337,2); #Oggok Gaurds
		quest::faction(274,-2); #Kazon Stormhammer
		quest::givecash(0,0,4,0);
		quest::exp(500);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 21964 => 1  )) 
		{
		quest::say("Erudite!! Dem big heads hab good tastin legs!");
		#Faction assumed to be same as for human and high elf
		quest::faction(228,2); #Clurg
		quest::faction(232,2); #Craknek Warriors
		quest::faction(261,2); #Green Blood Knights
		quest::faction(337,2); #Oggok Gaurds
		quest::faction(274,-2); #Kazon Stormhammer
		quest::givecash(0,0,4,0);
		quest::exp(500);
		quest::ding();
		}
	elsif ((($gold >= 10) && plugin::check_handin(\%itemcount, 13452 => 3))) 
		{
		quest::say("Here is da ogre butcher apron. Gos and cook."); 
		quest::summonitem(12217);
		#Verified on ZAM
		quest::faction(228,5); #Clurg
		quest::faction(232,5); #Craknek Warriors
		quest::faction(261,5); #Green Blood Knights
		quest::faction(337,5); #Oggok Gaurds
		quest::faction(274,-5); #Kazon Stormhammer
		quest::exp(500);
		quest::ding();
		}
	else 
		{
		quest::say("I don't need this.");
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:oggok  ID:49061 -- Chef_Dooga
