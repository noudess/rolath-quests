
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Hey, hello there $name.  It's been so busy around here lately. Barely time to eat and sleep, much have my fun. Oh well, keeps me employed. But and I really could use someone to [ help ] me out around here.");
		}

	if($text=~/help/i)
		{
		quest::say("Yea and if you can help me out with A few things that'd be great. Geez and where do we Start? I need someone to run over to [ Janam and Rebbys ]? Can you do that for me?");
		}

	if($text=~/Janam and Rebbys/i)
		{
		quest::say("Janam and Rebby are A couple of merchants working the area around the Theater of the Tranquil and the Ashen Order, in West Freeport. It's part of my job to keep tabs on those two rascals. I need someone to take this note to Rebby for me. Don't worry, your efforts won't go unnoticed $name.");
		# Message to Rebby ID-18923
		quest::summonitem("18923");
		}

	}


sub EVENT_ITEM
	{
	# Rebby's Rat Whiskers ID-13158
	if(plugin::check_handin(\%itemcount, 13158 => 1))
		{
		quest::ding();
		quest::say("Thank you $name, You have done well.");
		quest::exp("100");
		quest::ding();
		quest::givecash("7","0","0","0");
		#Factions verified on ZAM
		# Coalition of Tradefolk Underground 
		quest::faction(336,"10");
		# Coalition of Trade Folk
		quest::faction(229,"10");
		# Carson McCabe 
		quest::faction(329,"1");
		# Corrupt Qeynos Guards
		quest::faction(230,"1");
		# Freeport Militia
		quest::faction(330,"1");
		} 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10105 -- Nestral_TGaza



