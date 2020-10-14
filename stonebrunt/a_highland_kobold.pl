sub EVENT_DEATH_COMPLETE
	{
	# If the mob was a kejek cat, roll ran 1-1000 and if < 17 spawn
	# Rognarog The Infuritated
	$roll=plugin::RandomRange(1,1000);
	if ($roll < 17)
		{
		quest::spawn2(100201, 0, 0, $x, $y, $z, $h);
		}
	}
