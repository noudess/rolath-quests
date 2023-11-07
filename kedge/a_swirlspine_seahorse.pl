sub EVENT_SPAWN
	{
	my $roll;

	$roll = int(rand(4));

	# One out of 4 can see invis.
	if ($roll == 0)
		{
		$npc->ModifyNPCStat("see_invis",  "1");
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	my $roll;

	$roll = int(rand(2));

	# One out of 2 may spawn a Swirlspine Guardian.
	if ($roll == 0)
		{
		# Spawn a guardian at an offset from center.
		$h = int(rand(512));
		$newx = 133+int(rand(30))-15;
		$newy = -21+int(rand(30))-15;
		quest::spawn2(64092,0,0,$newx,$newy,-282,$h);	
		}
	}
