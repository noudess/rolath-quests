#West side of obelisk mob spawner

my $skeleton=14019;
my $zombie=14096;
my $minspawn=2;
my $maxspawn=6;
my $numalive=0;

my %spawnlocs = (
	1 => { "x" => -1581, "y" => -2002, "z" => 0.37, "h" => 0},
	2 => { "x" => -1594, "y" => -2015, "z" => 0.37, "h" => 0},
	3 => { "x" => -1563, "y" => -2011, "z" => 0.37, "h" => 0},
	4 => { "x" => -1575, "y" => -2024, "z" => 0.37, "h" => 0},
	5 => { "x" => -1589, "y" => -2031, "z" => 0.37, "h" => 0},
	6 => { "x" => -1550, "y" => -2021, "z" => 0.37, "h" => 0}
);

sub EVENT_SPAWN
	{
	SPAWN_WAVE();
	}

sub SPAWN_WAVE
	{
	$numalive = plugin::RandomRange($minspawn, $maxspawn);

	my $roll = plugin::RandomRange(1,100);
	if ($roll <= 50)
		{
		$mob=$zombie;
		}
	else
		{
		$mob=$skeleton;
		}

	for (my $j = 1 ; $j <= $numalive; $j++)
		{
        my $myx=$spawnlocs{$j}{"x"};
        my $myy=$spawnlocs{$j}{"y"};
        my $myz=$spawnlocs{$j}{"z"};
		quest::spawn($mob,0,0,$myx,$myy,$myz);
		}
	}

sub EVENT_SIGNAL
	{
	$numalive = $numalive -1;
	if ($numalive == 0)
		{
		quest::settimer("spawn", 60);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("spawn");
	SPAWN_WAVE();
	}
