sub EVENT_SPAWN
	{
	# Clear current Salana/Kindl
	quest::spawn_condition("gfaydark", 1, 0);
	quest::settimer("on", 30);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("on");
	quest::spawn_condition("gfaydark", 1, 1);
	}
