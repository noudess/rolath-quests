sub EVENT_SPAWN
	{
	quest::attacknpctype(4195);
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::signal(4195);
	}

sub EVENT_SIGNAL
	{
	quest::depop(4194);
	}
