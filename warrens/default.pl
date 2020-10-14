sub EVENT_DEATH_COMPLETE
	{
	# If the mob was level 15 or higher, give a chance of spawning
	# Grodl Ripclaw instead
	$roll=plugin::RandomRange(1,250);
	if ($roll == 1 && $npc->GetLevel() >=15)
		{
		quest::spawn2(101134, 0, 0, $x, $y, $z, $h);
		}
	}
