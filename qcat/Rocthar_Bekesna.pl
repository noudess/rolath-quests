sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("I've little time for banter. unless you have come to me for training as a [new warrior] of the Bloodsabers move along.");
		}

	if($text=~/new warrior/i) 
		{
		quest::say("A warrior want to be is more like it. You've got a lot of work to do if you're going to be a valued member of the temple of Bertoxxulous. the Plague Bringer. That pompous ruler Antonius Bayle IV has this city in a tight grip with the support of our enemies. the temples of Rodcet Nife and Karana. It is not safe for us to walk the streets of Qeynos openly. You must learn to hold your tongue when not within the walls of our temple here in the Qeynos Catacombs. Should the Qeynos Guards discover your devotion to the Plague Bringer they would surely execute you. We have enemies all about and you must [learn to defend] yourself.");
		}

	if($text=~/learn to defend/i) 
		{
		quest::say("Take this note to Illie Roln. He will help get you outfitted in a suit of armor. Once you have been properly outfitted return to me and I will tell you how you can make yourself useful. I have a [small task] in mind.");
		quest::summonitem(20205);
		}

	if($text=~/small task/i) 
		{
		quest::say("The Priests of Life and Knights of Thunder often travel the roads from Qeynos carrying messages for the farmers of the Plains of Karana and the Knights of Truth in Freeport on the opposite coast of Antonica. We have recently been sending Bloodsabers to the Plains of Karana in search of a possible location for a new hidden temple should the need arise. One of the messengers of the Knights of Thunder has alerted the peasants of the plains the possibility of a Bloodsaber presence there and is using them to track our motions. Find the messenger. Lukas Hergo. and bring me his head.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18853 => 1)) 
		{
		quest::say("A [new warrior] of hate always pleases me. Here is your tunic, please return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem(13598);
		quest::exp(100);
		quest::ding();
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priests of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 20175 => 1)) 
		{
		quest::say("Well done $name. Now take this Rusty Scourge Warrior Broadsword to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Tarnished Scourge Warrior Sword and a Giant King Snake Skin to Illie Roln and he will put the finishing touches on the weapon.");
		quest::summonitem(20176);
		# Verified on live
		quest::exp(130);
		quest::ding();
		quest::faction(221,10);
		quest::faction(262,-1);
		quest::faction(296,1);
		quest::faction(341,-2);
		quest::faction(230,1);
		quest::ding();
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:qcat  ID:45081 -- Rocthar_Bekesna
