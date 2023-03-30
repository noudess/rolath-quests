# Quests for Bard Lambent armor

sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Hail and good day to you $name. I am Cryssia Stardreamer of the League of Antonican Bards. My colleague Walthin and I are here while we deal in [lambent stones] with the followers of Solusek Ro. If you are interested, my partner and I also deal in [lambent armor]... the perfect armor for a bard of note.");
		}
	elsif($text=~/stones/i) 
		{
		quest::say("Lambent stones are gemstones of great power. They are midnight blue in color - if you want more information on them you should ask Genni.");
		}
	elsif($text=~/armor/i) 
		{
		quest::say("'Lambent armor is custom crafted armor, made especially for bards. It is forged by the MeadowGreen brothers and then enchanted by the followers of Solusek Ro. If you are interested, I can tell you about the [lambent helm], the [lambent breastplate], [lambent vambraces] or [lambent bracers]. My colleague Walthin can tell you about other lambent armor pieces.");
		}
	elsif($text=~/bracers/i) 
		{
		quest::say("Lambent bracers are nice armor, and do not have the same level of complexity that other lambent armor pieces possess. If you can fetch for me a dark boned bracelet from a greater dark boned skeleton, a griffenne charm and a lambent fire opal, I will give you a lambent bracer.");
		}
	elsif($text=~/breastplate/i) 
		{
		quest::say("Lambent breastplates are not cheap, but I can get you one if you bring me a few items I need for later trades with the followers of Solusek Ro. Bring me a basalt carapace from the caverns of Guk and a gypsy lute from the Castle of Mistmoore. You will also need to see Genni about getting me a lambent ruby. Collect these items for me, and I will give you a lambent breastplate.");
		}
	elsif($text=~/helm/i) 
		{
		quest::say("I can give you a lambent helm, but you will need to fetch me a few items I need for later trades with the followers of Solusek Ro. I require an opoline helm from a Deepwater goblin and a mudwater rune from Cazic-Thule. Finally, you will also need to see Genni about getting me a lambent star ruby. Bring me these items, and I will give you a lambent helm.");
		}
	elsif($text=~/vambraces/i) 
		{
		quest::say("I will give you lambent vambraces if you can acquire the following items for me - fiery vambraces from a Solusek champion and the top portion of the Rune of the One Eye from Choon. You will also need to see Genni about getting me a lambent sapphire. Acquire these items for me and I will give you lambent vambraces.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		#bracers
		if(plugin::check_handin(\%itemcount, 10564 => 1,10563 => 1,10128 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Well done. Here are your Lambent Bracers");
			quest::summonitem(4156);
			}

		#breastplate
		if(plugin::check_handin(\%itemcount, 4100 => 1, 10565 => 1, 10118 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Well done. Here is your Lambent Breastplate.");
			quest::summonitem(4154);
			}

		#helm
		if(plugin::check_handin(\%itemcount, 10559 => 1, 4099 => 1, 10117 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Well done. Here is your Lambent Helm");
			quest::summonitem(4153);
			}

		#vambraces
		if(plugin::check_handin(\%itemcount, 4113 => 1, 10560 => 1, 10119 => 1)) 
			{
			#Faction verified by zam
			quest::faction(415, 10);
			quest::faction(416, -1);
			$client->AddLevelBasedExp(2,30);
			quest::ding();
			quest::say("Well done. Here are your Lambent Vambraces.");
			quest::summonitem(4155);
			}
		}

	plugin::return_items(\%itemcount);
	}
