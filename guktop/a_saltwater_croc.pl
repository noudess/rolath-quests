# AC PH

sub EVENT_DEATH
	{
	# Tell AC spawn trigger about death
	quest::ze(15, "Telling trigger we died");
	quest::signalwith(999227, 1, 0);
	}
