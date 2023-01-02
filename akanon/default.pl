sub EVENT_DEATH_COMPLETE
	{
	if ($mname =~ /Clockwork/ and $mname !~ /Clockwork_MM/)
		{
		quest::spawn2(55008,0,0,$x,$y,$z,$h+256);
		#quest::spawn2(55008,0,0,$x-5,$y+5,$z,$h+120);
		#quest::spawn2(55008,0,0,$x+5,$y-5,$z,$h+240);
		}
	}
