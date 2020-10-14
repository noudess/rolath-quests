sub EVENT_SPAWN
	{
	my $meat;

	$meat = int(rand(99));	
	if ($meat < 12)
		{
		quest::addloot(13414, 1, 0);
		}
	}

