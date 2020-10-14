sub EVENT_SPAWN
	{
	my $shit = plugin::RandomRange(1,4);
	if ($shit == 1)
		{	
		$npc->SetRunning(1);
		}
	}
