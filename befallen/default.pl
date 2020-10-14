# Quest to make the PHs for Gynok shout.

sub EVENT_SPAWN
	{
	# Not sure when he and his PHs say this...
	if ($x == 24 && $y = -77)
		{
		# I can't tell why some PHs yell and some don't.  Not race related,
		# nor does it seem to be a sign of something to come.
		if(rand() <= 0.3)
			{
			quest::shout("Grrrraaaaaaaaugggggh! You have disturbed my rest! Suffer as I have!");
			}
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	# If we are grid 1 - we are a Gynok PH or Gynok himself

	if ($wp ==  0 && $grid == 1)
		{
		quest::SetRunning(0);
		}
	elsif ($wp = 305 && $grid == 1)
		{
		quest::SetRunning(1);
		}
	}
