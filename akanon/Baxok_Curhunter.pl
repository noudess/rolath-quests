sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_ENTER
	{
	#:: Match a 18770 - Recruitment Summons
	if (plugin::check_hasitem($client, 18770))
		{
		$client->Message(15, "Baxok Curhunter, a jittery older looking gnome appears to be startled.  'Well hello there.  You scared me!  You young ones always popping up here and there.  You would think there is a hidden tunnel somewhere around here the way you just popped up near me.  Well no matter.  If you are here to train with the warriors of Gemchopper Hall,  read the note in your inventory and hand it to me to begin your training.'");
		}
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail, $name. I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
		}
	elsif ($text =~ /trades/i)
		{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");

		#:: GIve a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
		}
	elsif ($text =~ /second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");

		#:: GIve a 51122 - Tradeskill Basics : Volume I
		quest::summonitem(51122);
		}
	elsif ($text =~ /an outsider/i)
		{
		quest::say("I should have guessed as much. You look the part.");
		}
	elsif ($faction > 5)
		{
		quest::say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		}
	elsif ($faction > 4)
		{
		quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you.  Search the hills for rogue clockworks.  Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	elsif ($text =~ /new recruit/i)
		{
		quest::say("Well, good to make your acquaintance, $name. Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
		}
	elsif ($text =~ /serve the crown/i)
		{
		if ($ulevel <= 5)
			{
			quest::say("You are too inexperienced. Leave that business to someone more worldly.");
			}
		else
			{
			quest::say("Go quickly then $name, hunt down a stolen clockwork named Gearheart who has been taken by the Faeries in Lesser Faydark and return to me his blackbox.");
			}
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 18770 => 1))
		{
		quest::say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to Naygog for further guidance. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13520); #Torn and Ripped Tunic
		#Factions verified on live
		quest::faction(255,100);	#Gem Choppers
		quest::faction(288,25); 	#Merchants of Al'Anon
		quest::faction(333,25); 	#King Ak'Anon
		quest::faction(238, -25);	#Dark Reflection
		quest::faction(1604, -5);	#Clan Grikbar
		$client->AddLevelBasedExp(2.5, 1);
		quest::ding();
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 13344 => 1))
		{
		quest::summonitem(quest::ChooseRandom(2013,2014,2015,2016,2017,2018,2019,2020,2021,2021,2022,2023,2024));	#Small Leather Armor
		#factions per ZAM
		quest::faction(255, 20);	#Gem Cutters
		quest::faction(288, 5);	#Merchants of Ak'anon
		quest::faction(333, 5);	#King Akanon
		quest::faction(238, -5);	#Dark Reflection
		quest::faction(1604, -1);	#Clan Grikbar
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:akanon  ID:55173 -- Baxok_Curhunter
