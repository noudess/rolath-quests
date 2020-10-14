sub EVENT_WAYPOINT_ARRIVE
	{
	if ($x == -4)
		{
		quest::signal(10,2);
		$npc->Depop(0);
		}
	}
