sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 0)
		{
		quest::shout("We have arrived at the Qeynos Docks.  All aboard for Erud's Crossing and Erudin!");
		quest::signalwith(1305, 5);
		}
	elsif ($wp == 1)
		{
		quest::signalwith(1305, 6);
		}
	elsif ($wp == 16 or $wp == 21)
		{
		quest::shout("Arriving at the Qeynos port shortly.  Make your way to the dock.");
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 0)
		{
		quest::shout("Departing the Qeynos Docks, watch your feet!");
		quest::signalwith(1305, 6);
		}
	}
