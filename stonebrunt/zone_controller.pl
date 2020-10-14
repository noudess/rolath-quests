my @pandas = (100170, 100070, 100063, 100069, 100032, 100033, 100036, 100067);
my @leopards = (100031, 100039, 100023, 100024, 100052, 100054, 100107, 100034, 100051, 100053, 100086, 100118);
my @tigers = (100035, 100059, 100072, 100148, 100155, 100156,100082, 100083, 100145, 100056, 100057, 100058);
my @snakes = (100025, 100026, 100087);
my @monkeys = (100037, 100038, 100071, 100074, 100096, 100119, 100060, 100061, 100114, 100101, 100173, 100098, 100100, 100157);

my $GIANG = 100208;
my $PROWLER = 100205;
my $SNOWBEAST = 100097;
my $SLYDER = 100076;
my $GHOSTBACK = 100209;

sub EVENT_DEATH_ZONE
	{
	# Track the death of titan races and titans themselves

	# If a titan is killed - clear the condition
	if ($killed_npc_id == $GIANG)
		{
		quest::spawn_condition("stonebrunt", 2, 0);
		}
	elsif ($killed_npc_id == $PROWLER)
		{
		quest::spawn_condition("stonebrunt", 3, 0);
		}
	elsif ($killed_npc_id == $SNOWBEAST)
		{
		quest::spawn_condition("stonebrunt", 4, 0);
		}
	elsif ($killed_npc_id == $SLYDER)
		{
		quest::spawn_condition("stonebrunt", 5, 0);
		}
	elsif ($killed_npc_id == $GHOSTBACK)
		{
		quest::spawn_condition("stonebrunt", 6, 0);
		}

	# If a PH died, set the titan that could spawn

	elsif (IS_IN_LIST(\@pandas, $killed_npc_id))
		{
		SPAWN_TITAN(2);
		}
	elsif (IS_IN_LIST(\@leopards, $killed_npc_id))
		{
		SPAWN_TITAN(3);
		}
	elsif (IS_IN_LIST(\@tigers, $killed_npc_id))
		{
		SPAWN_TITAN(4);
		}
	elsif (IS_IN_LIST(\@snakes, $killed_npc_id))
		{
		SPAWN_TITAN(5);
		}
	elsif (IS_IN_LIST(\@monkeys, $killed_npc_id))
		{
		SPAWN_TITAN(6);
		}
	}

sub SPAWN_TITAN
	{
    local($thecond);
    ($thecond) = ($_[0]);

	# See if we should spawn a titan
	my $longshot=plugin::RandomRange(1,325);

	if ($longshot == 1)
		{
		quest::spawn_condition("stonebrunt", $thecond, 1);
		quest::ze(15, "The ground rumbles...");
		$npc->CameraEffect(3000, 6);
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
