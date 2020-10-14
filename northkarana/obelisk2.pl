#East side of obelisk mob spawner

my $skeleton=13127;
my $zombie=13128;
my $ghoul=13095;
my $minspawn=2;
my $maxspawn=5;
my $numalive=0;

my %spawnlocs = (
	1 => { "x" => -2095, "y" => -3205, "z" => 29.44, "h" => 0},
	2 => { "x" => -2109, "y" => -3209, "z" => 31.99, "h" => 0},
	3 => { "x" => -2123, "y" => -3212, "z" => 34.32, "h" => 0},
	4 => { "x" => -2135, "y" => -3218, "z" => 37.01, "h" => 0},
	5 => { "x" => -2145, "y" => -3222, "z" => 38.50, "h" => 0}
);

sub EVENT_SPAWN
	{
	SPAWN_WAVE();
	}

sub SPAWN_WAVE
	{
	$numalive = plugin::RandomRange($minspawn, $maxspawn);

	my $roll = plugin::RandomRange(1,100);
	if ($roll <= 20)
		{
		$mob=$ghoul;
		}
	elsif ($roll <= 55)
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
