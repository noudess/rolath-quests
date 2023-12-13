sub EVENT_SPAWN
	{
	my $roll;

	$roll = int(rand(4));

	# One out of 4 can see invis.
	if ($roll == 0)
		{
		$npc->ModifyNPCStat("see_invis",  "1");
		}

	quest::settimer("die", 1800);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("die");
	quest::depop();
	}
