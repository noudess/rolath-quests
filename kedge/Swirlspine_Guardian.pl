sub EVENT_SPAWN
	{
	quest::settimer("die", 1800);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("die");
	quest::depop();
	}
