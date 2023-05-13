sub EVENT_SPAWN
	{
	# Roll for unique vials of shadow
	my $roll = plugin::RandomRange(1,1000);
	if ($roll <= 15)
		{
		if ($zoneid == 25) # Nektulos
			{
			quest::addloot(32032, 1, 1);
			} 
		elsif ($zoneid == 46) # Innothule
			{
			quest::addloot(32031, 1, 1);
			} 
		elsif ($zoneid == 27) # Lavastorm
			{
			quest::addloot(32033, 1, 1);
			} 
		elsif ($zoneid == 57) # Lesser Faydark
			{
			quest::addloot(32034, 1, 1);
			} 
		elsif ($zoneid == 14) # South Karana
			{
			quest::addloot(32035, 1, 1);
			} 
		elsif ($zoneid == 21) # West Commons
			{
			quest::addloot(32036, 1, 1);
			} 
		elsif ($zoneid == 20) # Kithicor
			{
			quest::addloot(32037, 1, 1);
			} 
		else
			{
			quest::debug("Shadowman in unknown zone");
			}
		}
	}
