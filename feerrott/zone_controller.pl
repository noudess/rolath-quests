my @bats = (47071, 47049, 47095, 47113);
my @other = (47094, 47060, 47057, 47070, 47066, 47096, 47080, 47001, 47051, 47075, 47002, 47061, 47072);
my @wolves = (47059, 47157, 47194);

my $ASSASSIN = 47172;

sub EVENT_DEATH_ZONE
	{
	# Track the death of PHs for Dark Assassin
	#
	# If a PH died, spawn him

	if (IS_IN_LIST(\@bats, $killed_npc_id) ||
		IS_IN_LIST(\@wolves, $killed_npc_id) ||
		IS_IN_LIST(\@other, $killed_npc_id))
		{
		my $longshot=plugin::RandomRange(1,200);

		if ($longshot == 1)
			{
			quest::unique_spawn($ASSASSIN, 242, 0, 2165, 601, -15.22, 244);
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
