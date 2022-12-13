sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Can you -hic- . . . spare some copper or -hic- . . . silver? I just . . . -Hic- . . . need some change to buy something to drin . . Er . . Eat . -Hic-");
		}
	if ($faction < 5)
		{
		if ($text =~ /tandan nybright/i)
			{
			quest::say("How did you know my name? You must be from Felwithe. Hic.. Excuse my condition. I am not the man I was. I have had a [shocking experience].");
			}
		elsif ($text =~ /shocking/i)
			{
			quest::say("My daughters have become blood thirsty bandits. They went off to visit Antonica and when they returned they became bandits. They now attack every poor traveler who happens upon them. They have disgraced the name of Nybright. Will you [hunt the Nybright Sisters] or is this not to your liking?");
			}
		elsif ($text =~ /hunt/i)
			{
			quest::say("I am most thankful. Many adventurers would not help me with this matter. Go and seek out the Nybright sisters. I gave all four of them a Personalized Necklace. Return them all to me when the deed is done. May the Tribunal watch over you.");
			}
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 13035 => 1))
		{
		quest::say("Thank you kind sir <hic>, I am most grateful for your generosity.");
		quest::exp(10);
		quest::ding();
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 13347 => 1, 13349 => 1, 13348 => 1, 13350 => 1))
		{
		quest::say("This is a sad day, but it was the just thing to do. The Nybright name will no longer be tarnished. Here you are my friend. This is a bit uncared for, but it is yours. My warrior days are over. Now go. I must be alone.");
		quest::summonitem(quest::ChooseRandom(2314, 2007, 2005, 23359));
		# Zam verified
		quest::faction(226,  10);
		quest::faction(279,  10);
		quest::exp(300);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if (($wp == 3) || ($wp == 9) || ($wp == 15) || ($wp == 24) || ($wp == 26)
		|| ($wp == 33))
		{
		quest::say("Please.. Can anyone spare some coppers? <Hic>.. Anyone?");
		}
	}

#END of FILE Zone:gfaydark  ID:54059 -- a_drunkard
