sub EVENT_SPAWN
	{
	$roll = plugin::RandomRange(0,100);
	if ($roll < 26)
		{
		quest::modifynpcstat("see_invis", 1);
		}
	}
