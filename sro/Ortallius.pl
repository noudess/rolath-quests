sub EVENT_SAY 
	{
	if($text =~ /hail/i) 
		{
		quest::say("Welcome to the lands of Ro. Stand and fight with me. We shall fight to reclaim the desert in the name of Solusek Ro. Death to all [dervish cutthroats]!!");
		}
	if($text =~ /dervish cutthroats/i) 
		{
		quest::say("The dervish cutthroats are the vile scum who inhabit the desert. They are rogues who assault wayward travelers. Solusek Ro has commanded their extermination!! Do you wish to [join the crusade]?");
		}
	if($text =~ /join the crusade/i) 
		{
		quest::emote("grins enthusiastically. 'The scum rarely wander far from their camps. Hunt them down and I will reward you for every three insignia rings you bring as proof of their deaths.'");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 12348 => 1, 12349 => 1))  #2 Gems
		{
		quest::say("You serve the Burning Prince as I do. The Redeemed has instructed me to give you this reward upon completion of your test. Practice your arts and prepare yourself. Evil approaches our realm. Long live Ro!!");
		quest::ding();
		quest::exp(1000);
		quest::summonitem(7041);	#Burning Rapier
		# Factions verified on live
		quest::faction(415,25);		#faction better: 'Temple Of Sol Ro'
		quest::faction(416,-1);		#faction worse: 'Shadowed Men'
		quest::givecash(0,0,0,4);
		}

	if (plugin::check_handin(\%itemcount, 1903 => 3)) 
		{
		quest::say("You will make a fine addition to the crusade. Continue the cleansing of the desert. Let it be known that the Defenders of Ro are here to challenge the evils of the desert. I call upon the righteousness of all paladins to assist me.");
		quest::ding();
		#Exp calculated based on ZAM post for less than 1% for 4x turnins at level 15.
		quest::exp(810);
		#faction verified on live
		quest::faction(415,5);		#Temple Of Sol Ro
		quest::faction(416,-1);		#Shadowed Men
		quest::givecash(8,4,0,0);
		quest::summonitem(quest::ChooseRandom(5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,3040,3042,3043,3044,3046,3047,3048,3049,3050,3051));
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}

#END OF FILE
