my @phs = (63011, 63021, 63032, 63054, 63055);

my $PINCER = 63112;

sub EVENT_DEATH_ZONE
	{
	# Track the death of unrest yard trash

	# If Shadowpincer is killed - clear the condition
	if ($killed_npc_id == $PINCER)
		{
		quest::spawn_condition("unrest", 1, 0);
		}

	# If a PH died, set the titan that could spawn
	elsif (IS_IN_LIST(\@phs, $killed_npc_id))
		{
		SPAWN_PINCER(1);
		}
	}

sub SPAWN_PINCER
	{
    local($thecond);
    ($thecond) = ($_[0]);

	# See if we should spawn ShadowPincer
	my $longshot=plugin::RandomRange(1,500);

	if ($longshot == 1)
		{
		quest::spawn_condition("unrest", $thecond, 1);
		quest::ze(15, "You hear maniacal clacking...");
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
