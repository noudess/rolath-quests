my $TWISTED = 15161;
my $counter=0;

sub EVENT_SPAWN
	{
	$counter=plugin::RandomRange(0,2000); # start counter at random spot
	}

sub EVENT_DEATH_ZONE
	{
	# All deaths increment a counter.
	# When that counter reaches 1000 we set a condition for a couple of
	# rares.  When they die, we clear that.
	if ($counter < 2000)
		{
		$counter = $counter + 1;
		}
	else
		{
		$counter=0;
		quest::spawn_condition("eastkarana", 3, 1);
		}

	# If a named is killed - clear cond
	if ($killed_npc_id == $TWISTED)
		{
		quest::spawn_condition("eastkarana", 3, 0);
		$counter = 0;
		}
	}
