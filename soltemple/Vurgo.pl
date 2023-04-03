sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
		}
	elsif($text=~/what harvester/i)
		{
		quest::say("I can forge you one, but you will need to bring me the correct [scythe components].");
		}
	elsif($text=~/what scythe components/i)
		{
		quest::say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
		}
	elsif($text=~/what words of darkness/i)
		{
		quest::say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
		}
	elsif($text=~/what word components/i)
		{
		quest::say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		if($itemcount{10529} == 1)
			{
			quest::say("A shadowed book! Well done! The more banished shadowed men the better. As the items of the shadowed men tend to disappear, I have given you a note to remind me that you have indeed supplied me with a book. Give me the note with the following items, and I will scribe for you Words of Darkness: a book of darkness from the Erudites in the tower by Lake Rathe, a book of frost from the icy goblin in Permafrost Keep and 300 golden coins. Bring me these items, and I will scribe for you the Words of Darkness.");
			# Faction Verified on ZAM
			quest::faction(415,1);
			quest::faction(416,-1);
			quest::summonitem(18945); # A note
			}

		if($itemcount{5103} == 1)
			{
			quest::say("A shadowed scythe! Well done! The only good shadowed man is a banished one. As the weapons of the shadowed men have a tendency to disappear, I have given you a note to remind me that you have indeed supplied me with a scythe. Give me the note with the following items and I will forge you a harvester: a fungus eye from a mortuary fungus in the Estate of Unrest, a shadowed knife from an island goblin headmaster in the Ocean of Tears and a fire opal. Give me these items, and I will forge for you a harvester.");
			# Faction verified on ZAM
			quest::faction(415,2);
			quest::faction(416,-1);
			quest::summonitem(18944); # A note
			}

		if($itemcount{10538} == 1 && $itemcount{10031} == 1 && $itemcount{7331} == 1 && $itemcount{18944} == 1) 
			{ # A Fungus Eye, Fire Opal, Shadowed Knife, Note
			quest::summonitem("5316"); # Harvester
			quest::ding();
			quest::exp(10000);
			quest::faction(415,1);
			quest::faction(416,-1);
			}

		if($itemcount{10536} == 1 && $itemcount{10537} == 1 && $itemcount{18945} == 1) 
			{ # Book of Darkness, Book of Frost, Note
			quest::summonitem("10527"); # Words of Darkness
			# Faction Verified on ZAM
			quest::faction(415,1);
			quest::faction(416,-1);
			quest::ding();
			quest::exp(10000);
			}
		}
	}
