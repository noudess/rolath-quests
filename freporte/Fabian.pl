sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		if ($faction > 5)
			{
			plugin::reject_say();
			}
		else
			{
			quest::say("Greetings, merry gentlefolk! If you enjoy the music, please feel free to cross my palm with gold.");
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		if ($gold >= 2) 
			{
			quest::say("Rat spittle! Busted another string! You seem like a good music loving citizen, could you please run to the Wind Spirit's Song and grab
			me a fresh set of lute strings?");
			# Faction verified on live.
			quest::faction(284, 2);
			quest::faction(281, 1);
			quest::faction(262, 1);
			quest::faction(304, -1);
			quest::faction(285, -1);
			quest::ding();
			}  

		if (plugin::check_handin(\%itemcount, 13709 => 1)) 
			{
			# Faction verified on live
			quest::say("Many thanks, merry gentlefolk! Let me cross your palm in gratitude for your kindness.");
			#Factions verified on ZAM
			quest::faction(284, 2);
			quest::faction(281, 1);
			quest::faction(262, 1);
			quest::faction(304, -1);
			quest::faction(285, -1);
			my $odds=plugin::RandomRange(1, 100);
			if ($odds < 26) # From a post on DBG
				{
				quest::summonitem(13710);
				quest::say("Hmmm.. Where did my lucky coin go?");
				}
			quest::exp(5000);
			quest::givecash(0,20,9,1);
			quest::ding();
			}

		if (plugin::check_handin(\%itemcount, 13710 => 1)) 
			{
			quest::say("My lucky coin!!  How did it get in there?  Well, never mind that.  You are an honest person and although honesty is its own reward, I feel obligated to return the favor.  Take this to Dionna if you enjoy music.  Farewell friend!");
			quest::faction(284, 2);
			quest::faction(281, 1);
			quest::faction(262, 1);
			quest::faction(304, -1);
			quest::faction(285, -1);
			quest::exp(5000);
			quest::summonitem(13708);
			quest::ding();
			}
		}
	}
