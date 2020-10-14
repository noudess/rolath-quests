#West side of obelisk mob spawner

my $skeleton=13059;
my $zombie=14017;
my $ghoul=13096;
my $minspawn=2;
my $maxspawn=5;
my $numalive=0;

my %spawnlocs = (
	1 => { "x" => -2060, "y" => -3202, "z" => 23.83, "h" => 0},
	2 => { "x" => -2049, "y" => -3204, "z" => 22.44, "h" => 0},
	3 => { "x" => -2040, "y" => -3205, "z" => 21.38, "h" => 0},
	4 => { "x" => -2034, "y" => -3206, "z" => 20.60, "h" => 0},
	5 => { "x" => -2024, "y" => -3208, "z" => 19.34, "h" => 0}
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
