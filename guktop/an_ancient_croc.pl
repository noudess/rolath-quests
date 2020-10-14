# AC PH

sub EVENT_DEATH
	{
	# Tell AC spawn trigger about death
	quest::signalwith(999227, 1, 0);
	}
