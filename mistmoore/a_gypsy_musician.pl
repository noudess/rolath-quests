sub EVENT_SPAWN
	{
	my $gender = plugin::RandomRange(0,1);
	$npc->RandomizeFeatures(1, 1);
	}
