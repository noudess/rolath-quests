sub EVENT_SPAWN
	{
	quest::settimer("$npcid", 4320);
	}

eub EVENT_TIMER
	{
	quest::stoptimer("$npcid");
	quest::depop();
	}
