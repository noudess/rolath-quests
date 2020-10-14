sub EVENT_SPAWN
	{
	my $mlevel = $npc->GetLevel();
	my $roll = rand();
	my $chance = $mlevel/2000;

	if ($roll < $chance)
		{
		quest::addloot(72371,1,0);
		}
	}
