my @animals = (14153, 14044, 14006, 14026, 14030, 14013, 14029, 14027, 14052, 14031, 14154, 14000, 14014, 14024, 14003, 14039, 14045, 14080, 14105, 14099, 14079, 14008, 14042, 14047, 14070, 14074, 14055, 14071, 14072, 14076, 14041, 14049, 14056, 14007, 14077, 14088);

my @grizzles = (14142, 14168);
my $GRIZZLE = 14142;
my $FABGRIZZ = 14168;
my $GROI = 14135;
my $SYNGER = 14125;
my $GRIMLIVE = 14143;
my $GRIMDEAD = 14134;
my $counter=0;

sub EVENT_SPAWN
	{
	$counter=plugin::RandomRange(0,2000); # start counter at random spot
	
	# reset the grimrot spawns	
	quest::spawn_condition("southkarana", 5, 0);
	quest::spawn_condition("southkarana", 6, 0);
	quest::spawn_condition("southkarana", 7, 1);
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
		quest::spawn_condition("southkarana", 4, 1);
		}

	# Track the death of animals and Named
	#
	# If a PH died, check for a named spawn

	if (IS_IN_LIST(\@animals, $killed_npc_id))
		{
		GRIZZLE();
		}

	# If a named is killed - clear cond
	if ($killed_npc_id == $GROI)
		{
		quest::spawn_condition("southkarana", 4, 0);
		}

	if ($killed_npc_id == $SYNGER)
		{
		quest::spawn_condition("southkarana", 4, 0);
		}

	# If a Grizzle is spawned - change it back
	if ($killed_npc_id == $FABGRIZZ)
		{
		quest::spawn_condition("southkarana", 3, 0);
		}

	if ($killed_npc_id == $GRIZZLE)
		{
		quest::spawn_condition("southkarana", 3, 0);
		}


	if ($killed_npc_id == $GRIMLIVE || $killed_npc_id == $GRIMDEAD)
		{
		quest::spawn_condition("southkarana", 5, 0);
		quest::spawn_condition("southkarana", 6, 0);
		quest::settimer("putrid", 10800);
		}
	}

sub GRIZZLE
	{
	# See if we should spawn a grizzle

	my $longshot=plugin::RandomRange(1,2000); 

	if ($longshot < 21) # This is for a Grizzle or Fabled Grizzle
		{
		# Make sure grizzle isnt up
		$up=0;

		foreach (@grizzles)
			{
			$npccheck = $entity_list->GetMobByNpcTypeID($_);
			if (defined($npccheck))
				{
				$up=1;
				}
			}

		if ($up == 0)
			{
			quest::spawn_condition("southkarana", 3, 1);
			}
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("putrid");
	quest::spawn_condition("southkarana", 7, 1);
	}

sub IS_IN_LIST
	{
	my $arr = shift;
	my $lnpc = shift;

	foreach (@{$arr})
		{
		if ($lnpc == $_)
			{
			return 1; 
			}
		}	

	return 0;
	}
