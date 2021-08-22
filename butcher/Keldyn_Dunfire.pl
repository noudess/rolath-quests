sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 8)
		{
		quest::SetRunning(1);
		}
	if ($wp == 24)
		{
		quest::SetRunning(0);
		}
	}
