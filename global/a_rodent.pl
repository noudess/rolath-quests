sub EVENT_SPAWN
	{
	my $run = int(rand(3));
	if ($run == 0)
		{
		quest::SetRunning(1);
		}
	}
