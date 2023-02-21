sub EVENT_SPAWN
	{
	quest::settimer("$npcid", 4320);
	}

sub EVENT_TIMER
	{
	quest::stoptimer($timer);
	quest::depop();
	}
