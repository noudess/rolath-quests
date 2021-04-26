sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 1)
		{
		my $grid = $npc->GetGrid();
		if ($grid == 236)
			{
			quest::SetRunning(1);
			}
		}
	}
