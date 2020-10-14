my @gobbies = (30003, 30016);
my @mammoths = (30044, 30045, 30091, 30028, 30040, 30052, 30066);
my @leopards = (30010, 30021, 30027);

my $ASSASSIN = 47172;

sub EVENT_DEATH_ZONE
	{
	# Track the death of PHs for Dark Assassin
	#
	# If a PH died, spawn him

	if (IS_IN_LIST(\@gobbies, $killed_npc_id) ||
		IS_IN_LIST(\@mammoths, $killed_npc_id) ||
		IS_IN_LIST(\@leopards, $killed_npc_id))
		{
		my $longshot=plugin::RandomRange(1,200);

		if ($longshot == 1)
			{
			# Mob is unique_spawn_by_name - no risk of 2
			quest::spawn2($ASSASSIN, 196, 0, -5462, -900, 165, 244);
			}
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
