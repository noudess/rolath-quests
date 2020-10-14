sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text =~/Hail/i) 
		{
		quest::say("I am Tv`ysa, guardian of the [Concordance of Research].");
		}

	elsif($text =~/Concordance of Research/i) 
		{
		quest::say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research', volumes I and II, help those who are [interested] in researching spells.");
		}

	elsif($text =~/interested/i) 
		{
		quest::say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
		}
	}

sub EVENT_ITEM
	{
	if($faction < 6 && plugin::check_handin(\%itemcount, 10300 => 1)) #Lightstone
		{
		quest::say("A lightstone ? Thank you very much. Here is a copy of 'Runes and Research' for you.");
		quest::summonitem(quest::ChooseRandom(18175, 18176));#Runes and Research Volume I or II
		#Faction verified on ZAM
		quest::faction(370, 1);#Dreadguard Inner
		quest::faction(334, 1);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
		$client->AddLevelBasedExp(5,15);
		quest::ding();
		}

	if($faction < 6 && plugin::check_handin(\%itemcount, 10400 => 1)) #Greater Lightstone
		{
		quest::say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		quest::summonitem(17504);#Concordance of Research
		#faction verified on ZAM
		quest::faction(370, 1);#Dreadguard Inner
		quest::faction(334, 1);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
		$client->AddLevelBasedExp(10,15);
		quest::ding();

		}
	else 
		{
		quest::say("I don't need this."); #text made up
		plugin::return_items(\%itemcount);
		return 1;
		}
	}
