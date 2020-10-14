
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("What do you want?  Can't you see that I wish to be alone?!  I have no need nor desire to speak with anyone.  I have a minor dilemma to ponder and the only person I wish to speak with is the [captain].");
		}

	if($text=~/captain/i)
		{
		quest::say("If you have to ask that. you should not be in this fine establishment.");
		}

	if($text=~/Danaria sent me/i)
		{
		quest::say("If you are working for Danaria, you have been misguided. You will go back to her empty handed. Now leave. The [captain] and I have some business to discuss.");
		}

	if($text=~/Portrait/i)
		{
		quest::say("You have the portrait! Give it to me... <Hic!> Danaria will not get it...");
		}

	}

sub EVENT_ITEM
	{
	# Capt. Orlin's Spiced Ale ID- 13817
	if($itemcount{13817} == 4)
		{
		quest::ding();
		quest::say("Mmmm... more... must... drown... sorrow...");
		quest::say("Mmmm... more... must... drown... sorrow...");
		quest::say("Mmmm... more... must... drown... sorrow...");
		quest::say("Ahh.. I.. Need help.. You.. take this.. Go build.. boat beacon. Ask gnomes about.. boat beacon. They know how.. Then bring back.. Unnnhh!! Prexus help me!! I will never drink again.");
		quest::me("In his drunkedness, Palatos advises you to seek out Svinal Wyspin, a Gnome merchant in North Freeport.");
		quest::exp("100");
		quest::ding();

		# Beacon Mount ID-12145
		quest::summonitem("12145");
		#factions verified on live
		# Craftkeepers 
		quest::faction(231,"2");
		# High Council of Erudin
		quest::faction(266,"1");
		# High Guard of Erudin 
		quest::faction(267,"1");
		# Heretics 
		quest::faction(265,"-1");
		}

	# Boat Beacon ID-13818
	elsif ($itemcount{13818} == 1)
		{
		quest::say("Thanks.. That saved me a lot of money. Now I can spend more time with the captain before I give this back to Lenka Stoutheart. Here is a little so...mething.");
		quest::exp("200");
		quest::ding();
		quest::givecash("0","0","0","1");

		#Factions verified on live
		# Craftkeepers 
		quest::faction(231,"10");
		# High Council of Erudin 
		quest::faction(266,"1");
		# High Guard of Erudin 
		quest::faction(267,"1");
		# Heretics 
		quest::faction(265,"-1");
		}

	# Ak'Anon's Portrait ID-12146
	elsif ($itemcount{12146} == 1)
		{
		quest::ding();
		quest::say("Wise decision! <Hic> Little reward for a large deed. Bye.");
		quest::exp("200");
		quest::ding();
		quest::givecash("0","0","0","1");

		#Factions verified on live
		# Craftkeepers 
		quest::faction(231,"5");
		# High Council of Erudin 
		quest::faction(266,"1");
		# High Guard of Erudin 
		quest::faction(267,"1");
		# Heretics 
		quest::faction(265,"-1");
		}
	}

