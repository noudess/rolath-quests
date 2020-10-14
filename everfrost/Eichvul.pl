sub EVENT_SPAWN
	{
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		quest::spawn2(30107, 0,0,-6292, 2843, -55, 204);
		quest::settimer("miner", 10);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("miner");
	quest::spawn2(30108, 0,0,-6136, 2702, -60, 436);
	}
