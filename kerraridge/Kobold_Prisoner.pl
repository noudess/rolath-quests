sub EVENT_SPAWN
	{
	}

sub EVENT_SAY 
	{
	}

sub EVENT_SIGNAL
	{
	if ($signal == 2)
		{
		quest::say("BARK BARK.  Stupid Cat!");
		}
	else
		{
		quest::signal(74120);
		}
	}
