sub EVENT_SPAWN
	{
	my $roll;

	$roll = int(rand(3));

	# One out of 3 can see invis.
	if ($roll == 0)
		{
		$npc->ModifyNPCStat("see_invis",  "1");
		}
	}
