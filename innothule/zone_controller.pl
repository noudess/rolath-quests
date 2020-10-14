my @triggermobs = (46024, 46087);

sub EVENT_DEATH_ZONE
	{
	my $c=$entity_list->GetClientByID($killer_id);		

	if (plugin::IS_IN_LIST(\@triggermobs, $killed_npc_id))
		{
		if ($c)
			{
			my $longshot=plugin::RandomRange(1,50);

			if ($longshot == 1)
				{
				quest::unique_spawn(46053,133,0, 0,1832,-26.20,0);	
				}
			}
		}
	}
