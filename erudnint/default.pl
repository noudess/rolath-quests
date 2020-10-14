sub EVENT_DEATH_COMPLETE
	{
	if ($mname =~ /Sentinel/)
		{
		quest::shout("Pop elemental");
		quest::spawn2(24309,0,0,$x,$y,$z,$h);
		}
	}
