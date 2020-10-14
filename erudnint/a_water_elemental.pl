sub EVENT_SPAWN
	{
	quest::settimer("poof", 120);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("poof");
	quest::depop();
	}
