sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 1)
		{
		my $grid = $npc->GetGrid();
		if ($grid == 239 || $grid == 240)
			{
			quest::SetRunning(1);
			}
		}
	}
