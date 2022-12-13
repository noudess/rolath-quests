my @wasps = (57030, 57029);
my @pixies = (57000, 57094, 57031, 57019);
my @faeries = (57100, 57069, 57143, 57101, 57070, 57142, 57141, 57123, 57010);
my @drixies = (57104, 57011, 57036, 57062);
my @spiders = (57027, 57049);
my @brownies = (57047, 57046, 57044, 57048, 57137, 57042, 57113, 57096, 57016);

my $CROOK = 57105;
my $WHIMSY = 57002;
my $MINA = 57120;
my $DIMMER = 57108;
my $QUEEN = 57005;
my $BRACKEN = 57122;

sub EVENT_DEATH_ZONE
	{
	# Track the death of rare races and rare themselves

	# If a rare is killed - clear the condition
	if ($killed_npc_id == $WHIMSY)
		{
		quest::spawn_condition("lfaydark", 3, 0);
		}
	elsif ($killed_npc_id == $MINA)
		{
		quest::spawn_condition("lfaydark", 4, 0);
		}
	elsif ($killed_npc_id == $DIMMER)
		{
		quest::spawn_condition("lfaydark", 5, 0);
		}
	elsif ($killed_npc_id == $QUEEN)
		{
		quest::spawn_condition("lfaydark", 6, 0);
		}
	elsif ($killed_npc_id == $BRACKEN)
		{
		quest::spawn_condition("lfaydark", 7, 0);
		}
	elsif ($killed_npc_id == $CROOK)
		{
		quest::spawn_condition("lfaydark", 8, 0);
		}

	# If a PH died, set the rare that could spawn

	elsif (IS_IN_LIST(\@pixies, $killed_npc_id))
		{
		SPAWN_RARE(3);
		}
	elsif (IS_IN_LIST(\@faeries, $killed_npc_id))
		{
		SPAWN_RARE(4);
		}
	elsif (IS_IN_LIST(\@drixies, $killed_npc_id))
		{
		SPAWN_RARE(5);
		}
	elsif (IS_IN_LIST(\@spiders, $killed_npc_id))
		{
		SPAWN_RARE(6);
		}
	elsif (IS_IN_LIST(\@brownies, $killed_npc_id))
		{
		SPAWN_RARE(7);
		}
	elsif (IS_IN_LIST(\@wasps, $killed_npc_id))
		{
		SPAWN_RARE(8);
		}
	}

sub SPAWN_RARE
	{
    local($thecond);
    ($thecond) = ($_[0]);

	# See if we should spawn a rare
	my $longshot=plugin::RandomRange(1,325);

	if ($longshot == 1)
		{
		quest::spawn_condition("lfaydark", $thecond, 1);
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
