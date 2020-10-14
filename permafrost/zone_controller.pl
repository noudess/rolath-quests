my @bears = (1170, 73110);

my $tcond=0;

# There are 2 possible bears where the injured bear spawns.
# One of them uses a spawn2 to be lying down.
# Because of this we use a spawn_condition and 2 spawn2 entries with
# different animations instead of a spawngroup with 2 entries.

sub EVENT_SPAWN_ZONE
	{
	if ($tcond == 0)
		{
		quest::spawn_condition("permafrost", 2, 0);
		quest::spawn_condition("permafrost", 1, 0);
		$tcond = quest::ChooseRandom(2, 1, 1, 1, 1);
		quest::spawn_condition("permafrost", $tcond, 1);
		}
	}

sub EVENT_DEATH_ZONE
	{
	# Track the death of the spot where injured bear can spawn
	# If it dies, see what should replace it on timer.

	if (IS_IN_LIST(\@bears, $killed_npc_id))
		{
		# cond 1 is normal and 80% likely.
		quest::spawn_condition("permafrost", 2, 0);
		quest::spawn_condition("permafrost", 1, 0);
		$tcond = quest::ChooseRandom(2, 1, 1, 1, 1);
		quest::settimer("spawnme", 1200);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "spawnme")
		{
		quest::spawn_condition("permafrost", $tcond, 1);
		}
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
