# Ice giant diplomat death causes either a PH or the Goblin Champion to spawn.

sub EVENT_DEATH_COMPLETE
	{
	# Roll for what mon spawns.
	$mynpc=quest::ChooseRandom(1005, 1169, 73067, 73067, 73067, 73072, 73072, 73072, 73073, 73073);

	quest::spawn2($mynpc, 11, 0, -98.83, 713.72, -38.65, 127.24);
	}
