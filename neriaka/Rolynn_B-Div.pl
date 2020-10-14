sub EVENT_WAYPOINT_ARRIVE 
	{
	if (($wp eq 3) || ($wp eq 8) || ($wp eq 18)) 
		{
		quest::say("Hear yee. Master Narex of the Indigo Brotherhood is offering one gold piece for every Leatherfoot Raider skullcap.");
		}
	}

sub EVENT_SAY
	{
	if ($faction >6)
		{
		plugin::reject_say();
		}
	elsif ($text=~/indigo brotherhood/i or $text=~/Narex/i or $text=~/leatherfoot raider/i)
		{
		quest::say("Talk to Head master Narex of the Indigo Brotherhood.  He will tell you.");
		}
	}
