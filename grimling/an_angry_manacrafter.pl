# Part of Danarin's raid

sub EVENT_SPAWN
	{
	quest::moveto(-100, -1213, -2.3, 0, 1);
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 0)
		{
		quest::moveto(-100, -213, -2.3, 0, 1);
		}
	}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == -100)
		{
		quest::forcedoorclose(68);
		}
	}
