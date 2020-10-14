# orc pawn picks & cutthroat rings quest

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		plugin::DoAnim("salute");
		quest::say("Greetings, traveler! If you wish to walk upon the road to Freeport, you will pay the toll of two silver pieces. And you should. It is not safe to stray from the pathway. There are many [dangers in the Commonlands].");
		}
	elsif ($text=~/dangers in the commonlands/i) 
		{
		quest::say("The orcs have been a nuisance of late. Many travelers have perished at the hands of the orc pawns. Would you like to [assist the Freeport Militia] in ridding the lands of the orcs?");
		}
	elsif ($text=~/assist the freeport militia/i) 
		{
		plugin::DoAnim("cheer");
		quest::say("Sir Lucan would be proud!! Patrol the Commonlands and watch for any orc pawns. Should you find any orc pawn picks on them, I will pay you for every four you return to me. Be off, then! For the glory of Freeport!!");
		}
	elsif ($faction > 5)
		{
		quest::say("Stand where you are, citizen. I believe you are wanted by the Freeport Militia.");
		}
	elsif ($faction > 4)
		{
		quest::say("Doing away with more orc pawns, and perhaps turning in the orc pawn picks to me, may increase my trust in you.");
		}
	elsif ($text=~/hunt dervish cutthroats/i) 
		{
		quest::say("You will make a fine reserve!! Take this bag and fill it with Dervish Cutthroat Insignia Rings. When they are combined and returned to me you shall be accepted into the Reserve Freeport Militia!!");
		quest::summonitem(17975);
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13885 => 4)) 
		{
		quest::say("You have done well. Keep up the good work and we may trust you to [hunt dervish cutthroats] which in turn will allow you to join the Reserve Freeport Militia.");
		quest::givecash(0,0,1,0);
		#Faction verified on ZAM
		quest::faction(330,3); #freeport militia
		quest::faction(336,1); #coalition of tradefolk underground
		quest::faction(281,-1); #knights of truth
		quest::faction(362,-1); #priests of marr
		$client->AddLevelBasedExp(10,8);
		quest::ding();
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 12272 => 1)) 
		{
		quest::say("Excellent work, $name!! You are quite formidable. Maybe soon you shall aid in our efforts to rid the Northern part of Freeport of the paladins!! Until then keep up the good work. Take this Armory Token to the Militia Armorer in the Militia House in Freeport to receive your tunic. He may not be there, but I assure you he will show up at some time. On the second floor. Hail Sir Lucan!!");
		quest::summonitem(12273);
		#Faction verified on ZAM
		quest::faction(330,10); #freeport militia
		quest::faction(336,1); #coalition of tradefolk underground
		quest::faction(281,-1); #knights of truth
		quest::faction(362,-1); #priests of marr
		quest::ding();
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}
