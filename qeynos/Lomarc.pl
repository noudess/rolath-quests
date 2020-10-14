sub EVENT_SAY
	{
	# Faction: Apprehensive
	if ($text=~/Hail/i)
		{
		if ($faction >= 6)
			{
			# Faction was apprehensive
			# Same message at indifferent.
			quest::say("Do I know you?  Don't stick your nose where it don't belog.  It might just get cut off.");
			}
		else
			{
			# Faction was dubious
			quest::say("To a wanderer of the Karanas such as myself, you are as insignificant as the dirt I walk on.");
			}
		}

	if ($text=~/blank scroll sheets/i)
		{
        quest::say("Blank scroll sheets, huh? 2 gold should make that happen.");
		}
	}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 16) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 43) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 70) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
}


sub EVENT_ITEM
	{
	if ($gold == 2)
		{
		quest::say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		quest::ding();
		# Validated
		quest::summonitem(18006);
		quest::faction(223,1);
		quest::faction(291,-1);
		quest::faction(230,1);
		quest::faction(262,-1);
		quest::faction(273,1);
		quest::exp(200);
		quest::ding();
		}

	# Package from Lomarc
	if (plugin::check_handin(\%itemcount, 18793 => 1))
		{
		quest::say("What the heck is this?!?  No money at all?  You'll pay for this you back-stabbing punk!");
		quest::say("Fishbait is about all you'll be good for, after I'm finished with you.");
		quest::attack($name);
		}

	}
