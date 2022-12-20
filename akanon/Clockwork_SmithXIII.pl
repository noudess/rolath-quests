sub EVENT_ITEM
	{
	# Polished Dark Reflection Mace
	if (plugin::check_handin(\%itemcount, 11085 => 1, 11396 => 1))
		{
		quest::say("Ah, click - brrr - click...  I can use this... Take... click .. shard");
		# Need text, faction, xp - Adding exp based on turn in of Dark Reflection Short Sword
		$client->AddLevelBasedExp(14.2, 10);
		quest::summonitem(1264);
		quest::ding();
		}

	# Rough Dark Reflection Staff
	if (plugin::check_handin(\%itemcount, 10999 => 1, 11039 => 1, 10975 => 1))
		{
		quest::emote("fashions the ebon drakeling scales into a grip on the shaft of the staff, places the harpies eye within a metal fixture, fastens the fixture to the top of the staff and carves some delicate runes into the wood. 'click... wrrrr... a staff for you sir. Click... wrrr.");
		quest::emote("puts the staff in a safe place and gives you a shard.");
		# Need text, faction, xp - Adding exp based on turn in of Dark Reflection Short Sword
		$client->AddLevelBasedExp(14.2, 10);
		quest::summonitem(1264);
		quest::ding();
		}

	# Sharp Dark Reflection Stiletto
	if (plugin::check_handin(\%itemcount, 11084 => 1, 13054 => 1))
		{
		quest::emote("fashions the giant rat pelt into a grip on the hilt of the stiletto and carves some delicate runes into the blade. 'click... wrrrr... a stiletto for you sir. Click... wrrr.");
		quest::emote("puts the stiletto in a safe place and gives you a shard.");
		# Need text, faction, xp - Adding exp based on turn in of Dark Reflection Short Sword
		$client->AddLevelBasedExp(14.2, 10);
		quest::summonitem(1266);
		quest::ding();
		}

	# Sharp Dark Reflection Short Sword and Ebon Drake Scales
	if (plugin::check_handin(\%itemcount, 11083 => 1, 11086 => 1))
		{
		quest::emote("fashions the ebon drake scales into a grip on the hilt of the sword and carves some delicate runes into the blade. 'click... wrrrr... a fine sword for the plague knights. Click... wrrr.");
		quest::say("Ah, click - brrr - click...  take... click .. this Rolath shard");
		# Confirmed on live including getting Ebon Drake Scales by combining Rough Dark Reflection Staff with sharpening stone in forge.  Exp, no faction.

		quest::summonitem(1266);
		$client->AddLevelBasedExp(14.2, 10);
		quest::ding();
		}

	# Sharp Dark Reflection Axe, Coyote Pelt
	if (plugin::check_handin(\%itemcount, 11082 => 1, 10703 => 1))
		{
		quest::emote("fashions the coyote pelt into a grip on the shaft of the axe and carves some delicate runes into the blade. 'click... wrrrr... an axe for you sir. Click... wrrr.'");
		quest::emote("puts the axe in a safe place and gives you a shard.");
		# Need text, faction, xp - Adding exp based on turn in of Dark Reflection Short Sword
		$client->AddLevelBasedExp(14.2, 10);
		quest::summonitem(1266);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}
