# Quests for Bard Lambent Armor

sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Greetings, $name. I am Walthin Fireweaver of the Temple of Solusek Ro. I am the protector of an ancient armor invented by long dead bards of the temple. This armor will help any bard in their journey across Norrath. Are you a bard that would desire to own some of this armor?");
		}
	elsif($text=~/no/i) 
		{
		quest::say("Very well.");
		}
	elsif($text=~/yes/i) 
		{
		quest::say("Very well. I craft a type of bardic armor that I invented called Lambent Armor. I can craft for you [boots], [gauntlets], and [greaves]. My friend Cryssia Stardreamer will craft for you the other pieces. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
		}
	elsif($text=~/boots/i) 
		{
		quest::say("Alright, I will require some items. Go and get me some Firewalker Boots, a Lambent Sapphire, and the middle piece of the Rune of the One Eye. Return to me with these items and I will craft your boots.");
		}
	elsif($text=~/gauntlets/i) 
		{
		quest::say("Alright, I need you to retrieve for me some Black Silk Gloves, a Lambent Star Ruby, and Shin Gauntlets. Return to me with these and I will craft your gauntlets.");
		}
	elsif($text=~/greaves/i) 
		{
		quest::say("Very well, return to me with these items and I will craft them. A set of Icy Greaves, a Lambent Fire Opal, and Shin Greaves.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		#boots
		if(plugin::check_handin(\%itemcount,2318 => 1, 10119 => 1, 10561 =>1)) ]
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Excellent. Here are your Lambent Boots.");
			quest::summonitem(4159);
			}

		#gauntlets
		if(plugin::check_handin(\%itemcount,2319 => 1, 10117 => 1, 4114 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Excellent. Here are your Lambent Gauntlets.");
			quest::summonitem(4157);
			}

		#greaves
		if(plugin::check_handin(\%itemcount,4115 => 1, 10128 => 1, 4116 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Excellent. Here are your Lambent Greaves.");
			quest::summonitem(4158);
			}
		}

	plugin::return_items(\%itemcount);
	}

