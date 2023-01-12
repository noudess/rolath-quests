sub EVENT_SPAWN
	{
	quest::settimer("depop", 45);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("depop");
	quest::depop();
	}
