sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Step forward and speak up, young $name! Kaladim can always use another warrior. Are you [ready to serve Kaladim] or has a yellow streak appeared down your back?");
		}
	elsif ($text =~ /ready to serve kaladim/i)
		{
		quest::say("Then serve you shall. Let your training begin on the battlefields of Faydwer. Seek out and destroy all [Crushbone Orcs]. Return their belts to me. I shall also reward you for every two orc legionnaire shoulder pads returned. A warrior great enough to slay one legionnaire shall surely have no problem with another. Go, and let the cleansing of Faydwer begin.");
		}
	elsif ($text =~ /crushbone orcs/i)
		{
		quest::say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
		}
	elsif ($text =~ /trondle ogrebane/i)
		{
		quest::say("Trondle Ogrebane is the legendary dwarven warrior who single-handedly exterminated the ogre clan called the [Mudtoes]. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
		}
	elsif ($text =~ /mudtoes/i)
		{
		quest::say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
		}
	elsif ($text > 6)
		{
		quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	elsif ($text =~ /irontoe/i)
		{
		quest::say("The Irontoe Brigade was formed by Drumpy Irontoe. It was once the finest band of warriors in Kaladim. They were the elite branch of the Stormguard. King Kazon sent them on a mission to the lands of the Crushbone orcs. At the Battle of Busted Skull they met their fate.");
		}
	elsif ($text =~ /bloodforge brigade/i)
		{
		quest::say("The Bloodforge Brigade is the elite force of the Stormguard. They took the place of the Irontoe Brigade. They are led by Byzar Bloodforge.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match four 13318 - Crushbone Belt
	if (defined($itemcount{13318}) && $itemcount{13318} > 0)
		{
        plugin::mass_handin(13318, 1, \&BeltReward);
		quest::say("Good work, warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
		}

	#:: Match four 13319 - Crushbone Shoulderpads
	if (defined($itemcount{13319}) && $itemcount{13319} > 0)
		{
		plugin::mass_handin(13319, 2, \&ShoulderReward);
		quest::say("Aha!! You have downed a Crushbone legionnaire!! You have shown yourself to be a strong warrior. Take this. This is more becoming of a great warrior such as yourself. Let no creature stand in the way of the Stormguard!");
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::returnUnusedItems();
	}

sub BeltReward
	{
	quest::summonitem(quest::ChooseRandom(9009, 2113, 2114, 2115, 2116, 2117, 2118, 2119, 2120, 2122, 2123, 2124));

	quest::ding();

	# Verified on Zam
	quest::faction(312, 10);	#:: + Storm Guard
	quest::faction(274, 1);		#:: + Kazon Stormhammer
	quest::faction(293, 2);		#:: + Miners Guild 249
	quest::faction(290, 1);		#:: + Merchants of Kaladim
	quest::faction(232, -2);	#:: - Craknek Warriors
	quest::exp(7000);
	#:: Create a hash for storing cash - 200 to 250cp
	my %cash = plugin::RandomCash(50, 90);
	#:: Grant a random cash reward
	quest::givecash($cash{copper}, $cash{silver}, $cash{gold}, $cash{platinum});
	}

sub ShoulderReward
	{
	quest::summonitem(quest::ChooseRandom(5013, 5014, 5015, 5016, 5019,5020, 5021, 5022, 5023, 5024, 5025, 6011, 6013, 6014, 6015, 6016, 10004, 10005, 10006, 10007, 10009, 10010, 10011, 10015, 10016, 10017, 10018, 10019, 10020, 10021, 10026, 10027, 10038, 10039));
	quest::ding();

	#:: Verified
	quest::faction(312, 15);	#:: + Storm Guard
	quest::faction(274, 2);		#:: + Kazon Stormhammer
	quest::faction(293, 2);		#:: + Miners Guild 249
	quest::faction(290, 3);		#:: + Merchants of Kaladim
	quest::faction(232, -3);	#:: - Craknek Warriors
	quest::exp(32000);

	my %cash = plugin::RandomCash(350, 450);
	quest::givecash($cash{copper}, $cash{silver}, $cash{gold}, $cash{platinum});
	}
