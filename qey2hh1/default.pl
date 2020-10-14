sub EVENT_DEATH_COMPLETE
	{
	# Only mobs in the area of Yiz Pon can set his condition.

	if ($x > -15500 and $x < -12800 and $y > -2000 and $y < 1150)
		{
		# Lets say 5% chance for each mob in the area.
		my $roll =  plugin::RandomRange(1,100);
		if ($roll < 6)
			{
			quest::spawn_condition("qey2hh1", 3, 1);
			}
		}
	}
