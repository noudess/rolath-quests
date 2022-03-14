sub EVENT_DEATH_COMPLETE
	{
	my $longshot=plugin::RandomRange(1,90);

	if ($longshot == 1)
		{
		if ($y < 1000)
			{
			quest::spawn_condition("rathemtn", 2, 1);
			}
		else
			{
			quest::spawn_condition("rathemtn", 3, 1);
			}
		}
	}
