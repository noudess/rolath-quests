sub EVENT_SPAWN
	{
	quest::set_proximity(339, 376, 322, 355, -3, -2);
	}

sub EVENT_ENTER
	{
	quest::stoptimer("despawn");
	quest::spawn_condition("frozenshadow", 2, 1);
	}

sub EVENT_EXIT
	{
	quest::settimer("despawn", 20);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("despawn");
	quest::spawn_condition("frozenshadow", 2, 0);
	}
