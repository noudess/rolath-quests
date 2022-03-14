my @undead = (50242, 50059, 50357, 50263, 50240, 50241, 50246);

sub EVENT_DEATH_ZONE
	{
	if (IS_IN_LIST(\@undead, $killed_npc_id))
		{
		YTYRS_TRY();
		}
	}

sub YTYRS_TRY
	{
	my $longshot=plugin::RandomRange(1,225);

	if ($longshot == 1)
		{
		quest::spawn_condition("rathemtn", 1, 1);
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
