#West side of obelisk mob spawner

my $skeleton=13129;
my $zombie=13130;
my $farmer=13017;
my $minspawn=1;
my $maxspawn=3;
my $numalive=0;

my %spawnlocs = (
	1 => { "x" => -1025, "y" => -3779, "z" => 7.27, "h" => 0},
	2 => { "x" => -1009, "y" => -3773, "z" => 8.13, "h" => 0},
	3 => { "x" => -998, "y" => -3769, "z" => 8.49, "h" => 0}
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
		$mob=$zombie;
		}
	elsif ($roll <= 55)
		{
		$mob=$skeleton;
		}
	else
		{
		$mob=$farmer;
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
