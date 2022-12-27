sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello, $name. It is grand to make your acquaintance. I am the in-house merchant-slash-file clerk. I have goods to offer and I handle all the Gemchopper paperwork. Thrilling, don't you think?");
		}
	elsif ($faction > 6)
		{
		quest::say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		}
	if ($text =~ /red/i)
		{
		quest::say("Red 5 is rumored to be a haywire clockwork. They say he pieced himself back together and lives in the scrapyard. If he IS there, you must hunt him down and take his blackbox to Manik Compolten. Be careful, if Red 5 rebuilt himself, he may have rebuilt minions as well.");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 7 && plugin::check_handin(\%itemcount, 18837 => 1))
		{
		quest::say("Why, thank you. Hey!! This log indicates some messy business is going on at the scrapyard. Something happened to a group of gnomes. They never came out!! Go check out the scrapyard! I believe the rumors of [Red 5] are true.");
		quest::exp(2000);
		#Factions per ZAM
		quest::faction(255,  5);	#Gem Choppers
		quest::faction(288,  1);	#Merchants of Ak'Anon
		quest::faction(333,  1);	#King Ak'Anon
		quest::faction(238,  -1);	#Dark Reflection
		quest::faction(1604, -1);	#Clan Grikbar
		quest::ding();
		}
	elsif ($faction < 7 && plugin::check_handin(\%itemcount, 18838 => 1))
		{
		quest::say("Oh my! It seems two of the obsolete duster models were not fully shut down. You must find them. They could be anywhere in Ak'Anon! After you destroy them, take their scraps to Sanfyrd Montop. He is the operator of the scrapyard");
		#Factions per ZAM
		quest::faction(255,  5);	#Gem Choppers
		quest::faction(288,  1);	#Merchants of Ak'Anon
		quest::faction(333,  1);	#King Ak'Anon
		quest::faction(238,  -1);	#Dark Reflection
		quest::faction(1604, -1);	#Clan Grikbar
		quest::exp(2000);
		quest::ding();
		}
	else
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	}
