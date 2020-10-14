sub EVENT_DEATH_COMPLETE
	{
	# Spawn a replacement sometimes
	if (rand(4) < 1.0)
		{
		quest::spawn2(80043,0,0,$x,$y,$z,$h);
		}
	}
