my $stald=5119;
my $totalorcs=6;
my @orcs = (407099, 407080, 407097, 407102, 407093, 407101, 407082, 407100, 407095);

sub EVENT_SPAWN
	{
	STALD();
	RESET_EXTRA_ORCS();
	}

sub EVENT_DEATH_ZONE
	{
	# Count orc deaths.
	if (plugin::IS_IN_LIST(\@orcs, $killed_npc_id))
		{
		$totalorcs = $totalorcs - 1;
		if ($totalorcs == 0)
			{
			RESET_EXTRA_ORCS();
			}
		}
	}

sub EVENT_SIGNAL
	{
	STALD();
	}

sub STALD
	{
    my $myx=0;
    my $myy=0;
    my $myz=0;
    my $myh=0;
	my $mygrid;

	my %spawnlocs = (
		1 => { "x" => -231, "y" => -173, "z" => -22.3, "h" => 148, "g" => 1},
		2 => { "x" => 367, "y" => -214, "z" => 20.48, "h" => 20.5, "g" => 2},
		3 => { "x" => 630, "y" => 232, "z" => 41.45, "h" => 313, "g" => 3}
	);

	my $spot=quest::ChooseRandom(1,2,3);
	
	$myx=$spawnlocs{$spot}{"x"};
	$myy=$spawnlocs{$spot}{"y"};
	$myz=$spawnlocs{$spot}{"z"};
	$myh=$spawnlocs{$spot}{"h"};
	$mygrid=$spawnlocs{$spot}{"g"};

	quest::spawn2($stald,$mygrid,0,$myx,$myy,$myz,$myh);
	}

sub RESET_EXTRA_ORCS
	{
	my $orc;

	$totalorcs = 6;
	for ($i=3; $i<7;++$i)
		{
		$orc = quest::ChooseRandom(0,1);
		$totalorcs = $totalorcs + $orc;
		quest::spawn_condition("highpasshold", $i, $orc)
		}
	}
